#ifndef _isample_ctrl_super_h_
#define _isample_ctrl_super_h_

#include "../../../cpp/isample_dcs_port_types.h"
#include "core.h"
#include "base_controller.h"

namespace gmt
{

class IsampleCtrlSuper : public BaseController
{
    public:
        IsampleCtrlSuper(std::string uri, uint32_t rate);
        virtual ~IsampleCtrlSuper();

        void setup() override;
        void step(bool setup_ok) override;

    private:

        // Create state variables
        StateVar<OperationalState>     ops_state_sv;
        StateVar<SimulationMode>       sim_mode_sv;
        StateVar<ControlMode>          control_mode_sv;

        // input port declaration
        HeartBeatEvent       heartbeat_in;

        // output port declaration
        HeartBeatEvent       heartbeat_out;

        // Define alarms for port and state_var health conditions

        // Base class shall be able to initialize state_var based on ports?
};

} // namespace gmt

#endif   // _isample_ctrl_super_h_