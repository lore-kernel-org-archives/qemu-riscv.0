Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQgQF-0007Qx-DY
	for mharc-qemu-riscv@gnu.org; Fri, 10 Feb 2023 22:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pQgQD-0007QT-8D; Fri, 10 Feb 2023 22:19:29 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pQgQ9-00068x-J1; Fri, 10 Feb 2023 22:19:28 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowADn5EAwCedjHzqBBA--.6213S2;
 Sat, 11 Feb 2023 11:19:14 +0800 (CST)
Message-ID: <f4cdeb7f-99db-cd87-54cd-baed603832db@iscas.ac.cn>
Date: Sat, 11 Feb 2023 11:19:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 RFC Zisslpcfi 1/9] target/riscv: adding zimops and
 zisslpcfi extension to RISCV cpu config
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Kip Walker <kip@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, liweiwei@iscas.ac.cn
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-2-debug@rivosinc.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230209062404.3582018-2-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADn5EAwCedjHzqBBA--.6213S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw17urWUJFWfXF1kJw4xZwb_yoW5tr43pr
 4DGa4akr1kJ34Ikas3tr1DGwn0k34kWw4Ig397Zw1kX3y3GrW5AFnFk3y3WFy5JFWrWw4S
 9Fs0kF13Zwsrta7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUU
 U==
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.149,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 11 Feb 2023 03:19:29 -0000


On 2023/2/9 14:23, Deepak Gupta wrote:
> Introducing riscv `zisslpcfi` extension to riscv target. `zisslpcfi`
> extension provides hardware assistance to riscv hart to enable control
> flow integrity (CFI) for software.
>
> `zisslpcfi` extension expects hart to implement `zimops`. `zimops` stands
> for "unprivileged integer maybe operations". `zimops` carve out certain
> reserved opcodes encodings from integer spec to "may be operations"
> encodings. `zimops` opcode encodings simply move 0 to rd.
> `zisslpcfi` claims some of the `zimops` encodings and use them for shadow
> stack management or indirect branch tracking. Any future extension can
> also claim `zimops` encodings.
>
> This patch also adds a dependency check for `zimops` to be enabled if
> `zisslpcfi` is enabled on the hart.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> Signed-off-by: Kip Walker  <kip@rivosinc.com>
> ---
>   target/riscv/cpu.c | 13 +++++++++++++
>   target/riscv/cpu.h |  2 ++
>   2 files changed, 15 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cc75ca7667..6b4e90eb91 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -110,6 +110,8 @@ static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
>       ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
>       ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
> +    ISA_EXT_DATA_ENTRY(zimops, true, PRIV_VERSION_1_12_0, ext_zimops),
> +    ISA_EXT_DATA_ENTRY(zisslpcfi, true, PRIV_VERSION_1_12_0, ext_cfi),

By convention, it  should be ext_zisslpcfi  .

>   };
>   
>   static bool isa_ext_is_enabled(RISCVCPU *cpu,
> @@ -792,6 +794,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>               return;
>           }
>   
> +        if (cpu->cfg.ext_cfi && !cpu->cfg.ext_zimops) {
> +            error_setg(errp, "Zisslpcfi extension requires Zimops extension");
> +            return;
> +        }
> +

If  Zisslpcfi implicitly means Zimops is implemented as commented in 
following code, I think we should just enable zimops  when zisslpcfi is 
enabled.

>           /* Set the ISA extensions, checks should have happened above */
>           if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
>               cpu->cfg.ext_zhinxmin) {
> @@ -1102,6 +1109,12 @@ static Property riscv_cpu_properties[] = {
>   #ifndef CONFIG_USER_ONLY
>       DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
>   #endif
> +    /*
> +     * Zisslpcfi CFI extension, Zisslpcfi implicitly means Zimops is
> +     * implemented
> +     */
> +    DEFINE_PROP_BOOL("zisslpcfi", RISCVCPU, cfg.ext_cfi, true),
> +    DEFINE_PROP_BOOL("zimops", RISCVCPU, cfg.ext_zimops, true),

These properties can not expose to users before all its functions are 
ready. And it need add 'x-' prefix as experimental extensions currently.

Regards,

Weiwei Li

>   
>       DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
>   
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f5609b62a2..9a923760b2 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -471,6 +471,8 @@ struct RISCVCPUConfig {
>       uint32_t mvendorid;
>       uint64_t marchid;
>       uint64_t mimpid;
> +    bool ext_zimops;
> +    bool ext_cfi;
>   
>       /* Vendor-specific custom extensions */
>       bool ext_XVentanaCondOps;


