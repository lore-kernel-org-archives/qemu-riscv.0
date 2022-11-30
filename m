Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0JKY-0005xp-Dl
	for mharc-qemu-riscv@gnu.org; Wed, 30 Nov 2022 04:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0JKU-0005wj-Nl; Wed, 30 Nov 2022 04:24:34 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0JKT-0007qZ-8h; Wed, 30 Nov 2022 04:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TtWM3lRAz2yFbpgRlGAbmEV3MNcA7vpFGDcPrEC8R2o=; b=fXWOCbnaOqm18S0/kkDSivkA9Q
 FvoXoJlV0YQXR4afJr0migNroQS7WWWvh0Q8MSUIf+Aw2svYkYGtF77sISbRYX6oS+70QU4QCEAgI
 ORxrc29GFsNlyEVUQv7MVTvUp21QIDausAl7zq8O/5tGTAoylRH80+Jwlkw2LxzD7j6PxB6nUbjh+
 Yzr056gmED3m62mqRcrii5r55rIOf2barki4cRoZF2Rr4j4msz7hhi6BDVUrOcjQ9kaIm0nVs4lW/
 jtmLC5mnQ9XIvhxFdLzptX6hfIfU4YFAGCfZAPJ0clCD2Lz5mEENS6txnjKet9ko/Iw6/4/IEY6KH
 grLZMKNZy+TgpYKARqWS5yd4XElDt4n913E2WTgQC+ayVJooeLb/lp3JJ6elZ3Hz1wXj/r252IYfO
 WQWXAgWJ21cdRuLBO9GDyb6Stkp58VCVdhIxM4hbj03GPCiJb2gWdd8eg/r1TdaFmVcPi22Ksjyp2
 Q0P8lwmzisCQDD/vxguWPbSDwB/5hqZGmDD4c66AkIVeQZnAsUQ8OJiEPUSXMyNkwizvFqzYZ0skB
 6ly4ngEDZPbIbp4RPbn2LyLGJscmuYczxYP705B4KB7kP3eTRlKIjwcNMAj/BpSCJeSZkplEENowc
 lah4Y/gl7UYmfdECGxKwK86RyXkxT609ZNGu/XBII=;
Received: from host86-149-46-27.range86-149.btcentralplus.com ([86.149.46.27]
 helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0JJd-000AmR-D8; Wed, 30 Nov 2022 09:23:45 +0000
Message-ID: <dbe2c845-077a-ab0c-6427-2ce2c56c9765@ilande.co.uk>
Date: Wed, 30 Nov 2022 09:23:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
 <20221124115023.2437291-18-peter.maydell@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20221124115023.2437291-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.149.46.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-8.0 17/19] target/sparc: Convert to 3-phase reset
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 30 Nov 2022 09:24:35 -0000

On 24/11/2022 11:50, Peter Maydell wrote:

> Convert the sparc CPU class to use 3-phase reset, so it doesn't
> need to use device_class_set_parent_reset() any more.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/sparc/cpu-qom.h |  4 ++--
>   target/sparc/cpu.c     | 12 ++++++++----
>   2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
> index 86ed37d9333..78bf00b9a23 100644
> --- a/target/sparc/cpu-qom.h
> +++ b/target/sparc/cpu-qom.h
> @@ -35,7 +35,7 @@ typedef struct sparc_def_t sparc_def_t;
>   /**
>    * SPARCCPUClass:
>    * @parent_realize: The parent class' realize handler.
> - * @parent_reset: The parent class' reset handler.
> + * @parent_phases: The parent class' reset phase handlers.
>    *
>    * A SPARC CPU model.
>    */
> @@ -45,7 +45,7 @@ struct SPARCCPUClass {
>       /*< public >*/
>   
>       DeviceRealize parent_realize;
> -    DeviceReset parent_reset;
> +    ResettablePhases parent_phases;
>       sparc_def_t *cpu_def;
>   };
>   
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index 4c3d08a8751..1734ef8dc6b 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -28,14 +28,16 @@
>   
>   //#define DEBUG_FEATURES
>   
> -static void sparc_cpu_reset(DeviceState *dev)
> +static void sparc_cpu_reset_hold(Object *obj)
>   {
> -    CPUState *s = CPU(dev);
> +    CPUState *s = CPU(obj);
>       SPARCCPU *cpu = SPARC_CPU(s);
>       SPARCCPUClass *scc = SPARC_CPU_GET_CLASS(cpu);
>       CPUSPARCState *env = &cpu->env;
>   
> -    scc->parent_reset(dev);
> +    if (scc->parent_phases.hold) {
> +        scc->parent_phases.hold(obj);
> +    }
>   
>       memset(env, 0, offsetof(CPUSPARCState, end_reset_fields));
>       env->cwp = 0;
> @@ -889,12 +891,14 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
>       SPARCCPUClass *scc = SPARC_CPU_CLASS(oc);
>       CPUClass *cc = CPU_CLASS(oc);
>       DeviceClass *dc = DEVICE_CLASS(oc);
> +    ResettableClass *rc = RESETTABLE_CLASS(oc);
>   
>       device_class_set_parent_realize(dc, sparc_cpu_realizefn,
>                                       &scc->parent_realize);
>       device_class_set_props(dc, sparc_cpu_properties);
>   
> -    device_class_set_parent_reset(dc, sparc_cpu_reset, &scc->parent_reset);
> +    resettable_class_set_parent_phases(rc, NULL, sparc_cpu_reset_hold, NULL,
> +                                       &scc->parent_phases);
>   
>       cc->class_by_name = sparc_cpu_class_by_name;
>       cc->parse_features = sparc_cpu_parse_features;

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

