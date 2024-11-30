Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4039D735EE
	for <qemu-riscv@archiver.kernel.org>; Sat, 30 Nov 2024 06:16:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tHGmB-0007QB-3K; Sat, 30 Nov 2024 01:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGm5-0007FG-GN
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:16:15 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGm1-0002th-EO
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:16:12 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2142214abd2so20089965ad.0
 for <qemu-riscv@nongnu.org>; Fri, 29 Nov 2024 22:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947365; x=1733552165;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=edTZ+SkrnE/JMBfnnHqKmdSdnVM2/S+y9Q27JWUYvuY=;
 b=2bXZe2YWuXB3Y/v/48XHvcM41ifr7J5f25bSSTpSMG5CmsQT4Lz7rJ/8Ei8kFJfm+Z
 Io7S9zwNya9u6b2C7Pk7dk5bFasxDtgV5SfQ5H9pvU31tcKcy4Oi94jL5RkUeMETmkxX
 2e8ikyhUbgPL9L8u5LwVAP2Vo/Z9TeMDTX5o5kvzmlPijnuoXLRTmLfxR45g/uh/vtz/
 ncNPTA+emmGdaC/Y+QA309myI0XJDg5sTVVLClxacXB3bCv/fL202Hz0iAFf5/iqgyzr
 qmm5Q3ZC5xqfxPs2Yetc+eOgwTXpqT4mnO1LXIRRCKWin79SMpIvqP5tCGqBRrprSvW9
 3I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947365; x=1733552165;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=edTZ+SkrnE/JMBfnnHqKmdSdnVM2/S+y9Q27JWUYvuY=;
 b=R4VQL2UQwfWs5EV6X0Y/CTfLnQMZXejs/gfmGA11ENWn+zjXnCqK5JZSUVhUXv1Ui+
 ODIBp7qFe9CUMMEq/mvdciXjSV9/iYFYLHaYcad/xlkNa+0cAMYRKpAhj+5546Obn2ig
 QFf5lm1u8DrGq6w0RmKPdkDFPpKJugzwIHCZIWsRI+N0WgVrZBJ0VPumaDyHRaSsO6sc
 b4Ut8bjcCXi93e1ptU5RqEbs0gcIq4Vm12/GM7tTySnF2PvoVJOHxInyTMO98mgZN7aS
 tKTuk4K633Ub/w/RMFVzmyAc21yHWaStXTF5Vhhb+Vi+joAPTrzChF7VNUl322ZHidrP
 xwng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlgmNuURvA+XOhg/Yp+k5TqsWUc3rwoPg+t6DdYPafOTwW0vkgFIMRTNTT4GEHO6bZAycuVGlETCeU@nongnu.org
X-Gm-Message-State: AOJu0Yz7qAj8wJ6N0OWFdc1+PvDJNoSXTUBX49/nbmDVY2Nrn6ZhbdVA
 SyPe3pXRlVFO++aMPb361TEzaOvQjUX4g2mXRqiWNDT8a9uaz9wYyuW3pqj0nLE=
X-Gm-Gg: ASbGncuNiEdjEb1wGtLydzAI770cpOU+tqliNpD3kaD2deg9ppRfu+E8JieYBJnLc/R
 i+vMCt2P2M0PeF/WVJESMuBd4Q3bmFvucdpbQRHPT5DE51GWYT/4DLphDg2JJraWjvY5TeDXC6W
 /hzn0HGS+XME+n4iZ3LImzsXwyyH3pI3lbauuLftIc4RjF0pNVgVM3pJkD6w7RkjT0cUHxI9zwx
 msdZsUj4SNFUhn01/eChQbynyfDS5OT+XjZM21X9Z+pGxBH+noTLpV22rj5EHo=
X-Google-Smtp-Source: AGHT+IHvQGamfokwJK7BI5T/fHPuhfGXHgs1BtPEnCH47dccAO21jGQdlWeZQf3rAM81vx/+8NxV8Q==
X-Received: by 2002:a17:903:364d:b0:212:66cc:8110 with SMTP id
 d9443c01a7336-21501f63cf0mr188002365ad.51.1732947364737; 
 Fri, 29 Nov 2024 22:16:04 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215413d3408sm22526655ad.159.2024.11.29.22.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:16:04 -0800 (PST)
Message-ID: <2a9bd2dc-9030-4074-8e51-8f902051a3f6@daynix.com>
Date: Sat, 30 Nov 2024 15:15:57 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 09/15] gpex: Allow more than 4 legacy IRQs
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu,
 Alexander Graf <graf@amazon.com>
References: <20241129152506.59390-1-phil@philjordan.eu>
 <20241129152506.59390-10-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-10-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 2024/11/30 0:25, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> Some boards such as vmapple don't do real legacy PCI IRQ swizzling.
> Instead, they just keep allocating more board IRQ lines for each new
> legacy IRQ. Let's support that mode by giving instantiators a new
> "nr_irqs" property they can use to support more than 4 legacy IRQ lines.
> In this mode, GPEX will export more IRQ lines, one for each device.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>

