Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BA8D735EE
	for <qemu-riscv@archiver.kernel.org>; Sat, 30 Nov 2024 06:18:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tHGoF-0000Rr-IP; Sat, 30 Nov 2024 01:18:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGnB-00084T-Ec
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:17:27 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGmt-0003Ac-JH
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:17:05 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2155157c58cso5582135ad.0
 for <qemu-riscv@nongnu.org>; Fri, 29 Nov 2024 22:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947419; x=1733552219;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SMWMQmaQNFbs3p5wPSSszQIsEvcT+kEUXSJDlAfkhFg=;
 b=OQ9uEgERxgHrwzbNTU6aRTmtjnKIlWGtIuHjJl5Wj5bhPsYlh5iuL8h9d/toTuKWuB
 Hq1G8kEJ+9/TtMhChBSyBGmzrTfNIFDN3Epo1Pg2kIQ2TlDWGEineusHBlK6p6XcP4QA
 MqM4ELAkUZGe7dB2o0dblpr4Jcwo6Cgkgt5jSJUwT9rF56CHKInVPLga36RZSYVY1mQA
 Dh9rqPvWm+UYPtVno2vdGEig2dhxJj7Pw7JWFBTnh74ny6LLYI6DABtyn4lHbJCUvTkl
 QrJjuK5OPAtlFdg236w0tlJ9arffG/2r+hCNm6jHyIlqcbOQU5UY4b1e1lSxmm5Fqh3O
 zYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947419; x=1733552219;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SMWMQmaQNFbs3p5wPSSszQIsEvcT+kEUXSJDlAfkhFg=;
 b=kC9CYNbPD5ny1ITpAb427CJxGBMNjbrcc3rDSCEwRsXceaxlxGdVdNFtw65LzDbwm0
 YWUDKkAJ9bbzPKezMSOJoC+6eHbxX5ezdIHN0zTymW4o2SQDkpr2HIktavvuwNuLVOR0
 k2zFAohYsdgM5uvsoOMksewkdLN2ZvHJyL2U0WiIc7xFNSyjyikpPSEYQtjXF8vO2UmN
 ii24VC6FUuXOB51bCv5dQThMt777ajvNYompOpTlFrPg6AbtaIwjwC98EAIsh7kDsx3a
 Of4tg5MOmLh3C21uiLjOabnasMYmgc+glJoJpkw/n3TU0dlLZmcs81kAJT5GgaYWFGi7
 FQIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOHgH4U9ye48cnjk4YU5iYaTH/OIHQmozGMYHjwsd7lkhVzIzEu+O2jn41EH82OkdHWD//R1Ivue1+@nongnu.org
X-Gm-Message-State: AOJu0Yzi3IPKbalcp9csxbsW6Tm5HEpi6a/PGpEb2AjFGA1vTODDBv/9
 LiylZH6DtRJWYw9hCB6HSZ7LPRCKpfNMJZquRcgoutKhygV69pGa0215IeESaF0=
X-Gm-Gg: ASbGncuuegAujC+YxQ622dPkx86q7Y8j0neDMedI0XHRslBU+V4xVY7BaxlYtX0ZAxt
 ETmIfRtup0Uz2kng6UwtWuT8+kS7jY1WaxxiLm0NlWHX4r4mjWWWe/BApz/mn7Jc/jpFf8X5GRE
 qf2mG1/xwslbzFpWtB777FqZrb2apFwOcJ2i0aITEm4/VYAxuaHPIa7oRQuzBJRsZScFhG6G+E0
 OOxj4pGLOCyEYxN9W4ysTBmaYDeQSlCZ3iWpeH44QX/+0LTN68g6faHW7QID4Y=
X-Google-Smtp-Source: AGHT+IHdgLpmBQWQf82JwBGq8q7QIpIow/7LNwAgRaz0kozm05KgQe9esf+MmtJnS5oK3ZpDikNylw==
X-Received: by 2002:a17:902:e881:b0:20c:c086:4998 with SMTP id
 d9443c01a7336-21501f622a5mr127905335ad.55.1732947419396; 
 Fri, 29 Nov 2024 22:16:59 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215475446e0sm19259595ad.92.2024.11.29.22.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:16:59 -0800 (PST)
Message-ID: <68b1a9fc-3a73-4c6a-92df-af69d20ce59b@daynix.com>
Date: Sat, 30 Nov 2024 15:16:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 11/15] hw/vmapple/bdif: Introduce vmapple backdoor
 interface
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
 <20241129152506.59390-12-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-12-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2024/11/30 0:25, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> The VMApple machine exposes AUX and ROOT block devices (as well as USB OTG
> emulation) via virtio-pci as well as a special, simple backdoor platform
> device.
> 
> This patch implements this backdoor platform device to the best of my
> understanding. I left out any USB OTG parts; they're only needed for
> guest recovery and I don't understand the protocol yet.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>

