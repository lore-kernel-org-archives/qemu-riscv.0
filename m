Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEhlZ-0005Xk-0X
	for mharc-qemu-riscv@gnu.org; Thu, 21 Jul 2022 21:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oEhlW-0005Uf-U5; Thu, 21 Jul 2022 21:47:43 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:60892 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oEhlU-0007GY-Jz; Thu, 21 Jul 2022 21:47:42 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-01 (Coremail) with SMTP id qwCowADng7y3AdpiXR9dAA--.17748S2;
 Fri, 22 Jul 2022 09:47:36 +0800 (CST)
Subject: Re: [PATCH v6 5/5] target/riscv: smstateen knobs
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
References: <20220721153136.377578-1-mchitale@ventanamicro.com>
 <20220721153136.377578-6-mchitale@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <5eda3670-f818-0a3b-8ab3-345ed258ab60@iscas.ac.cn>
Date: Fri, 22 Jul 2022 09:47:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220721153136.377578-6-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowADng7y3AdpiXR9dAA--.17748S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1ruw45Cw4fWFW3Xr17trb_yoW8WF1kpr
 4DK342kan8Jry3Zw4xtr4DJrZ5Cw45C39FgaykC3Z7XrZ3GrZrJ3ZrCrZrurWrtFWxur4I
 qF43ur1xArWDta7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUUH7K7UUUUU==
X-Originating-IP: [116.224.155.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 22 Jul 2022 01:47:43 -0000


ÔÚ 2022/7/21 ÏÂÎç11:31, Mayuresh Chitale Ð´µÀ:
> Add knobs to allow users to enable smstateen and also export it via the
> ISA extension string.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index db2b8e4d30..2b7ed95396 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -98,6 +98,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
>       ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
>       ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
> +    ISA_EXT_DATA_ENTRY(smstateen, true, PRIV_VERSION_1_12_0, ext_smstateen),
>       ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
>       ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
>       ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
> @@ -987,6 +988,7 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>       DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>   
> +    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, false),
>       DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>       DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>       DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),


Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>

Regards,
Weiwei Li


