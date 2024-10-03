# Copyright 2013-2023 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack.package import *

class ProdUtil(CMakePackage):

    """
    Produc utilities for the NCEP models.
    """

    homepage = "https://github.com/NCO-HPC/prod_util/tree/generic_v2.1.0"
    url = "https://github.com/NCO-HPC/prod_util/archive/refs/tags/v2.1.0.tar.gz"
    git = "https://github.com/NCO-HPC/prod_util/tree/generic_v2.1.0"

    maintainers("FloydFayton-NCO")

    version("2.1.0", branch="generic_v2.1.0")

    depends_on("w3emc")
    depends_on("bacio")

    def check(self):
        with working_dir(self.builder.build_directory):
            make("test")
    
