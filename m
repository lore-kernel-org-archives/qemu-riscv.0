Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E627ED735EE
	for <qemu-riscv@archiver.kernel.org>; Sat, 30 Nov 2024 06:15:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tHGkW-0004Ct-4W; Sat, 30 Nov 2024 01:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGkH-00042N-KW
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:14:24 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGkC-00028q-SX
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:14:18 -0500
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-7fbd76941ccso1806087a12.2
 for <qemu-riscv@nongnu.org>; Fri, 29 Nov 2024 22:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947254; x=1733552054;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HlKfcc4cbagcfZTiyYPu766Il1CxRL+XljhzeDMsrTw=;
 b=3KJqirg2K6AOhkVFP6pYQvgn1JtrzgqWoy3Q6K3VPPWEJqoTuBS6IPu0wpb+4ZOPAu
 k6kpPxWJ+c5oD+IJCV021nUPxGENY0qDjuS8mMPRg6HTEAw4dus9N9vrqDZEpjjJaxES
 18C3MYqinwoN+puq65JmWKmovg75v05ighUPh9alO76CX2U3FJW7JR1ALwb9n1JUEfWD
 /yg2L2FEnlyK+e24EsvkJsb2E2Nb/z1HGuuIIYFyhObLlcaNN7x9kiz3NQbUZqhLVowQ
 nGbUXpKTaDZE9+dBhe9DdpLIARA3zVjF2/sN3KtRqKLIKBYMaTotJz+lcYlHUhhxq5eR
 rmug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947254; x=1733552054;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HlKfcc4cbagcfZTiyYPu766Il1CxRL+XljhzeDMsrTw=;
 b=ZqAVDbhIWtz/Ltbrp9/b0unhYffQOvVsmzqv/kEbvdZ8I8LoO1UXqtDhkOlSOUCOvl
 rob1GwCn9aM1HKNMbGemfXECrt1tscukf3CHPbh3y6wP7JAkxI9UPyUHOnQ2+Ad3QrdX
 Pn6fqm653eq5bArhm/YYyZxnB0sIUtSMQFP0pc+3jGzzV5dKIhutw7RvXh4TetSrtUs8
 j+LjwDFD3rMqggv6HRtCdafyRXQ3IPTv1Y0dk1nFU3LTReRUayY0T/FljhvD7J3fBAhr
 t/W6xdA790k8nM8+GA/wuSsh0+mh/NIzCpLNt9LOJN1wXZ+IwyajK+YXF+woQOzxJmct
 tRcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrU/uIheEvnpATMyqLJR41boV0+UNawyyrTWn4NkIhku+ssgvGJwqYttKaQYtK3QYFYX3MtOk3ukj5@nongnu.org
X-Gm-Message-State: AOJu0Ywm4g8p7dNMlb2eoIanwxIEXLPddHOaCRv3EJ1lCMI6FW9GnqBh
 8XKTFVVJ8jEP3u9/pu6XccabzkJ20bcx1ik9BVe9ucJNYiZPsGUZos23P5L43v8=
X-Gm-Gg: ASbGncsuOrh2DUXDV79k+yMlGUlUbo++yS4tKR2GSJ6qSqH4dE9LwnygblTqrGxvKam
 NYJX3+HK7An2h/OumInG+M0m0wbecpjiqSZV370/Wxax7oAkWyiPCzp22D9D8k3Q4fTPw/XvM9e
 luF+sdiJw6SAD9u/9IzyTVvCo2Gc1U7qO4Y7OqDjTUiTJjdHeuWBHlXUHyIqNUIZTNIq8J54613
 LEvwDc31TeICn1uJFquRHP9m0cFiFC6J8Zy8smN28b8eP5IPslNTm6gtiznaPs=
X-Google-Smtp-Source: AGHT+IEYIhg+UrmWSJuwEixDlrdpu1iVPERUjad/M6gcv6ANFMa4g5jtp60Ra2P7rN0WGAZ1mTyEmQ==
X-Received: by 2002:a05:6a21:e90:b0:1db:d738:f2ff with SMTP id
 adf61e73a8af0-1e0e0ac69demr23710101637.2.1732947253903; 
 Fri, 29 Nov 2024 22:14:13 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72541761523sm4487121b3a.1.2024.11.29.22.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:14:13 -0800 (PST)
Message-ID: <21f34858-0298-40d1-af75-c2d97cdd159e@daynix.com>
Date: Sat, 30 Nov 2024 15:14:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 04/15] hw/display/apple-gfx: Adds configurable mode
 list
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
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu
References: <20241129152506.59390-1-phil@philjordan.eu>
 <20241129152506.59390-5-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-5-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x533.google.com
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

On 2024/11/30 0:24, Phil Dennis-Jordan wrote:
> This change adds a property 'display_modes' on the graphics device
> which permits specifying a list of display modes. (screen resolution
> and refresh rate)
> 
> The property is an array of a custom type to make the syntax slightly
> less awkward to use, for example:
> 
> -device '{"driver":"apple-gfx-pci", "display-modes":["1920x1080@60", "3840x2160@60"]}'
> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>

