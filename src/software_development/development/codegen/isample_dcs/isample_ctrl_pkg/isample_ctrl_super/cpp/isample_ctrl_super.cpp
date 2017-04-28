#include "isample_ctrl_super.h"

using namespace gmt;

IsampleCtrlSuper::IsampleCtrlSuper(std::string uri, uint32_t rate)
    : BaseController(uri, rate)
    , ops_state_sv("ops_state_sv", OperationalState::OFF, true)
    , sim_mode_sv("sim_mode_sv", SimulationMode::ON_LINE, true)
    , control_mode_sv("control_mode_sv", ControlMode::STANDALONE, true)
    {

    log_info("creating controller");
}

IsampleCtrlSuper::~IsampleCtrlSuper() {
}
