Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3EFC5B572
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 09:03:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wunoF-0003dh-T8; Fri, 14 Aug 2026 05:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wunnt-0003ae-CS
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 05:02:17 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wunnq-000646-Uq
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 05:02:17 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2cf49dc28ccso981415ad.0
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 02:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786698133; x=1787302933; darn=nongnu.org;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=zv21Ju1CxGfIwhFMAr33pqkhYdvDIuy2N7Zcm3Fklc0=;
 b=ahuk9m7peycErULOnC5vJh2phtU1t2AW2wCj7ZGFvlx2NiWQ+wSosuYiC2HtWFLUdX
 irkBJt/RkEQCx/AhfBWNsA1Jef1RFgowdUptaiJBhTWCnOYJdAsHIDKtKPzntPSf7W9J
 eSxarpiK+s1/SMWUvNKmKg5HLHGag/z9wvTqLajaNeYt+Gy/VRjrp8Q8gw0d+cM7CLOn
 zQQU9El5UoUOsX1ASg3zKsgUVSp2jHTr+Pkka5xqSdDl0q49EgdaXzieYqNhXVqgUXgN
 TQTyZGuPtP4CU7iyMnJ9Rc2mzlIx/+E0Q7EQlN6nxA8lYPDX6I5jsA2A9mY0KMqyuL6I
 aYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786698133; x=1787302933;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zv21Ju1CxGfIwhFMAr33pqkhYdvDIuy2N7Zcm3Fklc0=;
 b=A1KmdweedZ9y+e2pgfROGGa4p0HjD/+S6xdcG7i6CNqqfX2QZFWzSHT4c5MNjynUqn
 YjcJlsxh1phOmlFbZs44DB0TeWhgHQD1X98IY4cnxcjbpI0JzRXjIQzfDRCwwdAB1Cnj
 jTBJwphU5uCOZw4mcRtAVHc1xZVg8GtFOSuNIeCYAtPd8DomyTX5qeRaBiZcJlTkKe1G
 mFIOSrOwmeqIOWlNx0kXHON771N+2jHKNfOcUBs9su5pQ0/U2kaKPRm7zuffKSAGI540
 mxeVIlcENOk6e+ytySkhcwAwBzIf+17zXFaJOTM+HhUW0Tvup40k1LskT2veOzR5PG0a
 eYtw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro0/doum+kH6ezXFFrkFgp7AvUt2hlXNTGAj8wNA/P/uXmUZmS1LcPZF341xyf4H35zpbmS1wiETMYP@nongnu.org
X-Gm-Message-State: AOJu0Yw2xHKV3SgZAPfFp/N6kISnTYVvK/yVep7rqDcomCyWz1zWiA83
 e5pIL8lw6NFhPSVtjdNz7WLNIFNrKXwtAmofrrKOSgCkxw8vb05pl7kl
X-Gm-Gg: AR+sD10mqcXW7dsOtNORPtNwkZ46E1P2kh4IxWAbJEe91UAhE55buUcCrWkgDJ3qJ8s
 Acjt2w5D44TK7SyJD9U7/aMKKfDrW1i6A2kZgCWJpEkbd3dL6a/8XzD0HZYYGADXBiCI6p4JPGn
 RE6cnudxUj53t+6sgVxumI6k1jD0rzyLqkiIOXq7SqBgcYL6hk8xpj+W0Jp7FCyCd1zgqWodeVj
 H2V3YVZLmiRsBgYXTb+1pn48dgpLejERFQgiKZucqcaDgTVzXU2iyJ+0SgDg5L4eCIRuDL26RtO
 KlJCtnmFEQpaaCl5cFl/pQ2b/cKfuFmvMU34JlK3jqQnqpR7FoD9XhTmxakjb5V7d/1lvW68gSB
 mepzql9U34Yd5ZFdkinqDcjLKYNMrzqTHP63XnQOLUKt5L/IdB3vX2Go5chC5dTn0/+IAoXwbU1
 q84th1PxiCPqW/UJBYZKqB1HkRBLMGSW90nUF8jR1igbx1bYPrUH4waa/uYCnaBW4fK7bT
X-Received: by 2002:a17:902:f712:b0:2c4:397:dd7a with SMTP id
 d9443c01a7336-2d3b0e05b43mr35147095ad.4.1786698132705; 
 Fri, 14 Aug 2026 02:02:12 -0700 (PDT)
Received: from [127.0.0.1] ([38.34.7.236]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-320ea8f9d19sm2221124eec.27.2026.08.14.02.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2026 02:02:12 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 1/2] hw/gpio: add K230 GPIO controller model
From: Junze Cao <caojunze424@gmail.com>
To: guochun wang <guochun.wang@foxmail.com>
Cc: qemu-devel@nongnu.org, chao.liu@processmission.com, pbonzini@redhat.com, 
 farosas@suse.de, lvivier@redhat.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 qemu-riscv@nongnu.org
In-Reply-To: <b6fb4f19-2b6f-42c6-9f32-0cc2748ebf53@smtp-relay.sendinblue.com>
References: <tencent_EF996EEB2215272639C89FAE1491CEF43908@qq.com>
 <b6fb4f19-2b6f-42c6-9f32-0cc2748ebf53@smtp-relay.sendinblue.com>
Date: Fri, 14 Aug 2026 17:02:04 +0800
Message-Id: <178669812484.92831.14526253997081053698.b4-review@b4>
X-Mailer: b4 0.15.2
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=caojunze424@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, 10 Aug 2026 04:00:38 +0800, guochun wang <guochun.wang@foxmail.com> wrote:
> diff --git a/hw/gpio/k230_gpio.c b/hw/gpio/k230_gpio.c
> new file mode 100644
> index 0000000000..9d27f0bbfd
> --- /dev/null
> +++ b/hw/gpio/k230_gpio.c
> @@ -0,0 +1,362 @@
> [ ... skip 225 lines ... ]
> +    case K230_GPIO_PORTA_EOI:
> +        for (int i = 0; i < K230_GPIO_PINS_PER_GROUP; i++) {
> +            if (extract32(value, i, 1) && extract32(s->inttype_level, i, 1)) {
> +                s->raw_intstatus = deposit32(s->raw_intstatus, i, 1, 0);
> +            }
> +        }

Hi Guochun

Thanks for the patch. This is an addendum to Bin Meng's review, just for your reference.
In the EOI path, the model only checks inttype_level[i] == 1 and does not check int_bothedge[i] == 1. 

With INTTYPE_LEVEL = 0, INT_POLARITY = *, INT_BOTHEDGE = 1, and the line enabled in INTEN / not masked by INTMASK, 
the interrupt status will be set on either edge but never cleared by EOI,
so the IRQ line stays asserted.

Could EOI clear when either inttype_level or int_bothedge is set? A qtest with INTTYPE_LEVEL=0 and INT_BOTHEDGE=1 would cover this path.

Thanks,
Junze

>
> diff --git a/include/hw/gpio/k230_gpio.h b/include/hw/gpio/k230_gpio.h
> new file mode 100644
> index 0000000000..32005815d2
> --- /dev/null
> +++ b/include/hw/gpio/k230_gpio.h
> @@ -0,0 +1,71 @@
> [ ... skip 64 lines ... ]
> +    uint32_t config_reg1;
> +
> +    qemu_irq irq[K230_GPIO_PINS_PER_GROUP];
> +    qemu_irq output[K230_GPIO_PINS_PER_GROUP];
> +};
> +

GPIO0 and GPIO1 are not symmetric in the real hardware: GPIO0 has only Port A, while GPIO1 has both Port A and Port B. Port A is 32 bits on both controllers, and Port B is 8 bits on GPIO1.
The current model instantiates both controllers with the same 32-bit Port A only, so it cannot represent GPIO1's Port B / GPIO64-71.
If the goal is to build a more generic Synopsys DesignWare APB GPIO model later, I'd suggest adding qdev properties such as porta_width and portb_width, and configuring them at instantiation:


This is not strictly blocking the current SDK boot path, but it should be addressed if we want to support the full K230 GPIO range or keep the model reusable for other DW-style GPIOs.

Thanks，
Junze

GPIO0: porta_width = 32, portb_width = 0
GPIO1: porta_width = 32, portb_width = 8

GPIO0: porta_width = 32, portb_width = 0
GPIO1: porta_width = 32, portb_width = 8

-- 
Junze Cao <caojunze424@gmail.com>

