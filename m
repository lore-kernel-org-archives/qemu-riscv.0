Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNuF4-00043V-Jv
	for mharc-qemu-riscv@gnu.org; Tue, 16 Aug 2022 06:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oNuF3-00043F-R6; Tue, 16 Aug 2022 06:56:13 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:39143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oNuF2-0004Bz-7L; Tue, 16 Aug 2022 06:56:13 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MkEdF-1ndXme1UgD-00khPV; Tue, 16 Aug 2022 12:55:41 +0200
Message-ID: <19ca6b92-4bfa-de9d-3f96-f1c008bc42b7@vivier.eu>
Date: Tue, 16 Aug 2022 12:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/7] target/m68k: Honour -semihosting-config userspace=on
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Furquan Shaikh <furquan@rivosinc.com>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-4-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220815190303.2061559-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tY6WgihIAzHHYynSTuPLVLzC5fhUU4qp5OIpiRobmqle3HZM5nQ
 D2BpYvbmaiFKl+D21dzZmmbYgksHgS1b85wH0IJXllS8yNXH8tag3iZU6q2HM3WOYikoYbd
 20xdhT9jnfHuLgTQkdIbQT6llajQGbLzDW+nqZjA0xXTYCa+YtIzPqVswSdvuib/bGyxeNS
 LMijM+UIXwc7BIt2dza1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UxH64Jl9SuA=:uOU9d6DfC7MbSWQwl7W25Z
 ROUcy8cn1G983BXxEUWOM0D0OUPUJXww6tP+x1OLhEP106PXLonmSkQHHQ87FaKaF0FioJAYS
 /Q9IKcQ/c0AWP6/VcveiR7IVRsk0pEPfCMgY4514+T88F8qDnWU6b8thM0Ah0IhGixszdUkx2
 hWo+RLfksbpMRKmlh66P5vPqU/bs7pcgWDLqnSIT12V+HBKyhatWXoN28108t1+nn5mW1V2Ex
 dhuFNAJl4JF5zLbInRU3w5Om63pmz+uykHD3ZMhHjjdZOhmU6g44iykYLDCLrm965gdL4VlJ2
 bkDjsAsG6RPrOGpvLoG1PuUCOmVLt5oLFFemwYGJq5ijTqqXzEyz/CgQP7OrG8BUKtMoMh3mN
 xkFvUUCh4jP20seJRf1BObYcTnQg5OW5AzM1bHP5ZqEe0QGVk3bcxeTaNZ1j7R5PBYlXAxxFC
 CLJvEc45djN1pXK3QCmJ1JNeQRNAVgpDF0Lzb3MVN+dxVs2e1ZzOSB1BSM7/gqxv3PNDeW9rp
 wwgjdcsiFhTAHQ4R/2zZfZPG+KXmaWe+RLEKPhBcN2rzfm/3R3ZkXVTmz5jtLe0wukiBDeUkP
 2lBRxkWYPBPLdD5SYUFuoQj025+AfEBB/Jvq7rIXAJ68qM8QF3JnkAN3rfyOtamX8+xEDqzY5
 N9mVgbvkvUnjwrD8VlyoGnH+kIm9M1POjCuKuqeQ/UpWLaP+bmp9PFGumqQssFvpFSO4BQ5K+
 UjkaZEWgYO/w3eOKc7QPJxox3svulLmLNvd88A==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Aug 2022 10:56:14 -0000

Le 15/08/2022 à 21:02, Peter Maydell a écrit :
> Honour the commandline -semihosting-config userspace=on option,
> instead of never permitting userspace semihosting calls in system
> emulation mode, by passing the correct value to the is_userspace
> argument of semihosting_enabled(), instead of manually checking and
> always forbidding semihosting if the guest is in userspace.
> 
> (Note that target/m68k doesn't support semihosting at all
> in the linux-user build.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/m68k/op_helper.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index 4b3dfec1306..a96a0340506 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -203,8 +203,7 @@ static void cf_interrupt_all(CPUM68KState *env, int is_hw)
>               cf_rte(env);
>               return;
>           case EXCP_HALT_INSN:
> -            if (semihosting_enabled(false)
> -                    && (env->sr & SR_S) != 0
> +            if (semihosting_enabled((env->sr & SR_S) == 0)
>                       && (env->pc & 3) == 0
>                       && cpu_lduw_code(env, env->pc - 4) == 0x4e71
>                       && cpu_ldl_code(env, env->pc) == 0x4e7bf000) {

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

