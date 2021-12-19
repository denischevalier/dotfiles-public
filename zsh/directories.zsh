export DEV_ROOT="${HOME}"/Dev
[[ ! -d "${DEV_ROOT}" ]] && mkdir "${DEV_ROOT}"
export GITHUB_ROOT="${DEV_ROOT}/github.com"
[[ ! -d "${GITHUB_ROOT}" ]] && mkdir "${GITHUB_ROOT}"

[[ -d "${GITHUB_ROOT}"/denischevalier ]] && export ME_SRC_PATH="${GITHUB_ROOT}"/denischevalier
[[ ! -d "${ME_SRC_PATH}" ]] && mkdir "${ME_SRC_PATH}"

me() {
  cd "${ME_SRC_PATH}/${1}"
}
