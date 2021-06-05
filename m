Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lpbWP-0007Ko-1a
	for mharc-qemu-riscv@gnu.org; Sat, 05 Jun 2021 14:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbWN-0007J7-Dz; Sat, 05 Jun 2021 14:59:47 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:55597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbWL-0006Xf-Mo; Sat, 05 Jun 2021 14:59:47 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N0FE1-1lThFa2TQd-00xIUx; Sat, 05 Jun 2021 20:59:25 +0200
Subject: Re: [PATCH v2] target/riscv: Do not include 'pmp.h' in user emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-trivial@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20210516205333.696094-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <874705b6-7986-32d2-b6f1-d1a3f00447df@vivier.eu>
Date: Sat, 5 Jun 2021 20:59:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210516205333.696094-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Vqp74uNc6PGrTTWOysKjbD5uImjtnDGOVkGZSZYCwbeyDf/JiNB
 BY9pBtxqiWhsoDc8SzGK9umRiYSxmXfpo0e11xGgzvNA/Vz6Zkn6p42UNCk6qu8zsd4GLcF
 wImK8FvQVcrhVecicnJ++yj1orX3ATj9Kzqi59uqFJKzyasHkNwq+QzOrz7ZD7krtbCnqjb
 4stoaANXaOCiO5K8RWIYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KAy08WSTWJw=:Vdj19V8fNwH+0Osyc4w7AI
 HhkA414/J5UM7K3OHJA8LQaFYnArGUM94xnctElRl2rINg5vzDLaRr/B3Ji/RosZ1BLFttXkp
 aH7c5abDGuut17zu3x1nOuRXFaM4oW02yx//8oKRJmiGzVjqMFYY3zm1KR5EqHzWE2S97S18A
 wVjTSmz7nFIBQexaKvDVieUiOm3dc+jw3tjqTurkvU1s2Sxov9OiNVFEr+Gf9QkOjLoDr7WqN
 DQVd9XxQNzfJX1LZmKEUTSdCPZTHg6qDod/Z21gNaUgi0j9FL3gAiQihbFdFPLPzVOrHN9gth
 F8bjEhnsZEUF0kLLYXrjMwoV0an2Ii6mKPPDQg8NuW6rJ7ZinM6ztBwiJpzhwvhpMc/U6K8vC
 +8MmY1JkikV0AgySNji9pA/HdbV8GxFHlkr73UsqSqVIO2H4hjjl0LYqRtoZKAbqE52p4T7gN
 Iw01B8biKLWxnJuWYHkwjfYcDWC9dJJC+FlgwhfSfd8bno3U3+lpQ5+4o1Wgg2N5LfiO/9Hxy
 wz7LvLul76fq+wpBYVQjmM=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.59,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 05 Jun 2021 18:59:47 -0000

Le 16/05/2021 à 22:53, Philippe Mathieu-Daudé a écrit :
> Physical Memory Protection is a system feature.
> Avoid polluting the user-mode emulation by its definitions.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/riscv/cpu.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7e879fb9ca5..0619b491a42 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -97,7 +97,9 @@ enum {
>  
>  typedef struct CPURISCVState CPURISCVState;
>  
> +#if !defined(CONFIG_USER_ONLY)
>  #include "pmp.h"
> +#endif
>  
>  #define RV_VLEN_MAX 256
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


