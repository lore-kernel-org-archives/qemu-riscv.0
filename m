Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nfmoh-00029P-Px
	for mharc-qemu-riscv@gnu.org; Sat, 16 Apr 2022 14:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nfmoU-00024j-MM; Sat, 16 Apr 2022 14:06:27 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nfmoT-00014e-30; Sat, 16 Apr 2022 14:06:26 -0400
Received: by mail-wm1-x333.google.com with SMTP id y21so5125119wmi.2;
 Sat, 16 Apr 2022 11:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9ub6J1wn4ONoq49UUgaAmsmUWnZrSN/WLNJuyk6FImc=;
 b=U2R0Zxz1WYUl1ard/FGnT/Fd+rnUAjlIJyxoIH/ucZV1CriJvLoWRB8n3H/SnT7f3n
 0Z6ZX0nLDFs0x/088knEo5QtVSgys+bUiaKUYY/khxtjUM2zlf2iLqTCBgvh/Ja6Fe/q
 V26OMN42Gf/N4++ZCLArylsbEaAUe2PRFJunjOzPFQu2w9A76odHaz03ya+AQPValF94
 iii+3VNr7RG/q4kAb3VdiD4g0IViq3uOYOh6JpRauAAzZnuZbsmn1FsdRcpGAKTECga5
 nEg6e+UrnfdsmZcwhr60yp2YGu7Kk1DQ0ydi58yH2XC+laY/HNW49DDUtQ+33mZxhmNN
 jxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9ub6J1wn4ONoq49UUgaAmsmUWnZrSN/WLNJuyk6FImc=;
 b=vLHmIXlao00Nh/ZBfqoCxMRvnwDKvNnYc919+ez9k0aLkdJ8GTvpClegq3osxGXEMA
 L2p2EEAgE2SECNHn3o3MIZwP1bCF67gxKI7nchi0k52fQ2rGhqHJB4WgxeFGL6Plry0M
 mOu8EHvm8iPWG6egTU6d+gwYKhYou9de5ZbzCMW4GP83WmfDkBmZuVeVAq6y8B2xqvKa
 u9mueHnMn5ccwq9qrdSaTgztLCdwsI0VonOGzBOpex+WD6KAGXRvXuNmxam+K/rlxTVh
 ixV0T+W3XS52vuSiIkUijIUFHTUxHJpA0N6vGrP2JAWXnUfsAXV0dafAe3WVk6b20nT0
 /vWg==
X-Gm-Message-State: AOAM531gGahT/mfYXAhQJzGyTR2y/WxBiQJAhJwm5hcFHK0TVjHZhsht
 Tvk6U2K+dMzC6VQ89VipWFM+/pG5Yx4=
X-Google-Smtp-Source: ABdhPJzogCN+FZT/fIDv+7ssQ5RECnInDSZ9pkWcrY+8LghbSCDzrUBaO1TtNcE9YAgR2j3yd8UxUg==
X-Received: by 2002:a1c:cc11:0:b0:389:e8aa:ad4b with SMTP id
 h17-20020a1ccc11000000b00389e8aaad4bmr3894229wmb.79.1650132383039; 
 Sat, 16 Apr 2022 11:06:23 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:a0d5:a739:3557:2461?
 ([2600:70ff:f07f:0:a0d5:a739:3557:2461])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c441000b0038ebcbadcedsm17475732wmn.2.2022.04.16.11.06.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Apr 2022 11:06:22 -0700 (PDT)
Message-ID: <a4b8b72b-2465-cc15-7a18-ddaf7d3302bd@gmail.com>
Date: Sat, 16 Apr 2022 20:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 09/18] hw/arm/xlnx-zynqmp: convert cpu clusters to
 arm_cpus
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
 <20220330125639.201937-10-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220330125639.201937-10-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 16 Apr 2022 18:06:32 -0000

On 30/3/22 14:56, Damien Hedde wrote:
> qom-path of cpus are changed:
> + "apu-cluster/apu-cpu[n]" to "apu/cpu[n]"
> + "rpu-cluster/rpu-cpu[n]" to "rpu/cpu[n]"
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   include/hw/arm/xlnx-zynqmp.h |   8 +--
>   hw/arm/xlnx-zynqmp.c         | 121 +++++++++++++----------------------
>   2 files changed, 48 insertions(+), 81 deletions(-)

>   static void xlnx_zynqmp_create_bbram(XlnxZynqMPState *s, qemu_irq *gic)
> @@ -296,7 +282,8 @@ static void xlnx_zynqmp_create_apu_ctrl(XlnxZynqMPState *s, qemu_irq *gic)
>           g_autofree gchar *name = g_strdup_printf("cpu%d", i);
>   
>           object_property_set_link(OBJECT(&s->apu_ctrl), name,
> -                                 OBJECT(&s->apu_cpu[i]), &error_abort);
> +                                 OBJECT(arm_cpus_get_cpu(&s->apu, i)),
> +                                 &error_abort);
>       }

Possible further improvement, XlnxZynqMPAPUCtrl can now take a link to
one ArmCpusGroup, instead of array of ARMCPU.

