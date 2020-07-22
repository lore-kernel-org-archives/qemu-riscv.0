Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jy4qS-0008NU-Ev
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jul 2020 22:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jy4qP-0008M4-I0; Tue, 21 Jul 2020 22:50:57 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:52392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jy4qM-00028P-M4; Tue, 21 Jul 2020 22:50:57 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1049182|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0577189-0.000867167-0.941414;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01l10434; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.I5dorAA_1595386246; 
Received: from 30.225.208.49(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.I5dorAA_1595386246)
 by smtp.aliyun-inc.com(10.147.41.231);
 Wed, 22 Jul 2020 10:50:47 +0800
Subject: Re: [PATCH 00/11] RISC-V risu porting
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com,
 chihmin.chao@sifive.com, alex.bennee@linaro.org, peter.maydell@linaro.org,
 wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com
References: <20200711161655.2856-1-zhiwei_liu@c-sky.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <c6fbf67e-3674-faf6-2107-cdfad956d296@c-sky.com>
Date: Wed, 22 Jul 2020 10:50:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200711161655.2856-1-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 22:50:48
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jul 2020 02:50:57 -0000

Ping.

On 2020/7/12 0:16, LIU Zhiwei wrote:
> In contrast to the RFC, add more instructions description. Now it supports
> RV64IMACFD. Some cross verifications have been done, such as comparison
> between QEMU and TinyEMU, and comparison between QEMU and C906 FPGA.
>
> Now it has some productive.
>
> Features:
> * support RV64IMACFD.
> * support multi-precision float point.
> * support accurate special values generation.
>
> Todo:
> * support RVV and RVP.
>
>
> LIU Zhiwei (11):
>    riscv: Add RV64I instructions description
>    riscv: Add RV64M instructions description
>    riscv: Add RV64A instructions description
>    riscv: Add RV64F instructions description
>    riscv: Add RV64D instructions description
>    riscv: Add RV64C instructions description
>    riscv: Generate payload scripts
>    riscv: Add standard test case
>    riscv: Define riscv struct reginfo
>    riscv: Implement payload load interfaces
>    riscv: Add configure script
>
>   configure              |   4 +-
>   risu_reginfo_riscv64.c | 132 +++++++++
>   risu_reginfo_riscv64.h |  28 ++
>   risu_riscv64.c         |  47 +++
>   risugen_riscv.pm       | 643 +++++++++++++++++++++++++++++++++++++++++
>   rv64.risu              | 466 +++++++++++++++++++++++++++++
>   rv64c.risu             |  97 +++++++
>   test_riscv64.s         |  85 ++++++
>   upstream/configure     | 204 +++++++++++++
>   9 files changed, 1705 insertions(+), 1 deletion(-)
>   create mode 100644 risu_reginfo_riscv64.c
>   create mode 100644 risu_reginfo_riscv64.h
>   create mode 100644 risu_riscv64.c
>   create mode 100644 risugen_riscv.pm
>   create mode 100644 rv64.risu
>   create mode 100644 rv64c.risu
>   create mode 100644 test_riscv64.s
>   create mode 100644 upstream/configure
>


