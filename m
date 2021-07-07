Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1D1N-00071G-JE
	for mharc-qemu-riscv@gnu.org; Wed, 07 Jul 2021 15:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1D1M-00070A-2B; Wed, 07 Jul 2021 15:15:44 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:60865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1D1K-0005HJ-Am; Wed, 07 Jul 2021 15:15:43 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MMWgb-1liiGV2Jnj-00Ja2m; Wed, 07 Jul 2021 21:15:36 +0200
Subject: Re: [PATCH v3] linux-user/elfload: Implement ELF_HWCAP for RISC-V
To: Kito Cheng <kito.cheng@sifive.com>, alistair.francis@wdc.com,
 palmer@dabbelt.com, frank.chang@sifive.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, richard.henderson@linaro.org
References: <20210706035015.122899-1-kito.cheng@sifive.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2a78bbd7-6de8-a352-acbf-9fe623c1f34f@vivier.eu>
Date: Wed, 7 Jul 2021 21:15:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706035015.122899-1-kito.cheng@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pLSpjv0CA+ihiN7D0HliSck0vdHi8+TBVEcrnccETxNUGPvc4Ft
 JtceQl4O91gb4wEQM7OmGj05vMJhRrZDUV82NSJAh2T16NsAExjsiU/V7PSwmHPlctgmFBg
 snI/79nAFxifofAIkK2lBoaDinV4BNwTcAlyBSR0EphAaxExQNMU5V8gi663kK+jO9KhMGT
 v1Ea8dCoxcQmnc683za2w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FsF9jB2O2AU=:hrJkeTuPyByPmdOcvoH+rT
 CSEqWK+RvHJNdwdI9JFN79krDFjDr313gzDW9OpfV3Ov99wY0iCf9aV+VX12QeQTavptjYk5b
 vudewrgFPN+QalxY3Qd5JRl6o15t9I/isE8KncLMIuZLAmaImhtiMECe5zQGncReOxRIqn2TJ
 KZfa1SiLPIXq9Mz094cSs+5VnPUyIL2241ai7qzA4KE5+z0u93WfLUHQnoCiYHLNhM0sxcSH+
 kfDDa59dTLAH037GDYm10nuAXfFgFaVPTy/dQ0hjSw991jFB1K+1NrGD9PNUq3N9TkxCRWV0v
 CugD1lNZKvdWKC6sAci9x0m9LSvyGrWz7JbMFQUx6nKZt2VBTHqmtzD/5sQXwsodn13mBqixA
 iqzp7GX3ueldcZiXPEU672fL/uNXJnPfJbNKuFw7Kh6gd2ppBHXkFWaMLeRtp6R/o/SU6Nanl
 wamuv0NyMDAlz07RR7LhVn3LfylzPAfrjdgtHAnpxw6GWMjp62Vgz8v9U76JooPgugaleFW+Y
 xynEngqigG5TXdlAwq9FAPN7nDciusB+yEcL7G7j/hYiDZsHIkP0b2MKe2MecLGqSrLnrxNQX
 WxgknnCPt3uvfXXIT68VdjEl/IgirRemHbJjmnwtaygiCX2sC8/Kew0j1XVt9bCc1rb0BE8y5
 6xvUHAXMbNfEQaHxdYTRWtITEz6NirTLurqm/n0LCpDb5IfxuMTt0a1PaunqT081x3vYJ0rtp
 HFHUdY3o0FCAA4Py+hSNxoW05K+vdneQ01uTdShUfHv4frnWp4duc8x/w1VLz9rG+C4bv2tgi
 Jop1UAWvIqk+aYOKZlZPemwnQpgZVvza4DkRd3ta/GL1Pvp9p+AtSmoupxNnJjXqLZJGg0y
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 07 Jul 2021 19:15:44 -0000

Le 06/07/2021 à 05:50, Kito Cheng a écrit :
> Set I, M, A, F, D and C bit for hwcap if misa is set.
> 
> V3 Changes:
> - Simplify logic of getting hwcap.
> 
> V2 Changes:
> - Only set imafdc bits, sync with upstream linux kernel.
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> ---
>  linux-user/elfload.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 598ab8aa13..42ef2a1148 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1434,6 +1434,19 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
>  #define ELF_CLASS ELFCLASS64
>  #endif
>  
> +#define ELF_HWCAP get_elf_hwcap()
> +
> +static uint32_t get_elf_hwcap(void)
> +{
> +#define MISA_BIT(EXT) (1 << (EXT - 'A'))
> +    RISCVCPU *cpu = RISCV_CPU(thread_cpu);
> +    uint32_t mask = MISA_BIT('I') | MISA_BIT('M') | MISA_BIT('A')
> +                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C');
> +
> +    return cpu->env.misa & mask;
> +#undef MISA_BIT
> +}
> +
>  static inline void init_thread(struct target_pt_regs *regs,
>                                 struct image_info *infop)
>  {
> 

Applied to my linux-user-for-6.1 branch.
(I have removed the history from the commit message)

Thanks,
Laurent


