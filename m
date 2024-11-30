Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312FBD735EE
	for <qemu-riscv@archiver.kernel.org>; Sat, 30 Nov 2024 06:15:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tHGl7-0005g2-A2; Sat, 30 Nov 2024 01:15:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGl1-0005Pk-RS
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:15:08 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGkz-0002PQ-2S
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:15:07 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-724d57a9f7cso2180029b3a.3
 for <qemu-riscv@nongnu.org>; Fri, 29 Nov 2024 22:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947303; x=1733552103;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6v8c+4n8PNASpPmO24mcFTCtnVQLOXWkdrZBdPE8Ne0=;
 b=zSNt7BRcvNLiWe/OT0QLOHu6mzu3YD2F1paIYjYo1Tuvu/YVHEOB/T7IQ+CxZb4kyp
 iBjw8wnhMAM7/jsPLMTaqjqj0QWrbvB5Se9u05tuWbP2txP198/Gmi5yc98DUOBwrbzj
 8383aD+C70Yts1Er3u61EZ8ytZ5u0IafBvRgMLmsDGFmJsS5NWXzUCct1bVkT5Dz5+dY
 Mh/l3cnytmQ5m+TUeSB2yqakp31+i1lqxEDTqAVNhDqGZnG1+Q1njAY9kmkjjMDxyHLB
 yts8fKrJvP+yJI8yJKIUOEGAxBIHc6TVBhe33sMaomk4YyvPLXQHL0ZNhq4O/+kOyGmg
 9kRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947303; x=1733552103;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6v8c+4n8PNASpPmO24mcFTCtnVQLOXWkdrZBdPE8Ne0=;
 b=E8PzzY368d1fAqglQQsLQ6fZxRMEnsEwtpwQvADGJE07rlmkp6l8kT5i0khJVI4r2U
 PUp5w0jg0kiKBUr2ylCjt9sFy8F7+klHgYiJpyVTv5JlXwdgtYDoZ7gnlDI8sOqeHT4l
 bH4/VhBXwArgzB45TJC7qumSIx7S7Q26zN1Qhi9902YfaVFSJXacjK8m49bsAoXgTV3x
 kILLV+HNp+f8i5WT7WPOR+2iN/nyJyuJkua3zYDRdIOAMb9EkTQ/fFMIBoTHmi5kjS+G
 mgzGg01mC21uSjQEm1CUwPn+fVRV+AhdzKrm8D9lapSlvg5Xnza+ELShBbdt/qG9nJEc
 OL1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAMCaR87mCgYP9YaasJ0wQD1ci5/vPNWURxxGdYXDNweipO2rAcxhMGesirMAjKhR2NGAtAVwVr9kT@nongnu.org
X-Gm-Message-State: AOJu0YxrAE91//GwycnoNFXfpSxaMg85haHO661P8359EU0Gendz7KeQ
 4Hsf4mE7gKlnnFwGiCyZOUESp2V8zmuh7lo/mla2D3+J8xxcnefu9YJ60ybEDko=
X-Gm-Gg: ASbGncvyfkZWL9mLFZMDdh4Aqes7mktiOuvUhDudGgLisARLY4WY2hXpxVBOKIHuNt+
 WtaN8ZCSVYpj9RttxEmMcw6yAdD+zgtqD6oV/Xkysg7GJ9piXCwcSvt3xELwXBVtEwg41ZmbcIU
 RlzB3kiYTb7VPUlk6/1XdpfixM6K95C/DpdWAL0BJnesxF0jCM9BEjGAzWXzHZU/5Zlh/xCkAlE
 WA4fXUiZJzwN2DqTWxzoXaj5Z1tFR7l8ErrOQo/hjrhgzvj1E0LOHDU1s7KDk8=
X-Google-Smtp-Source: AGHT+IHMWNklXem3hK9mmjupXGtiZMZoXbiL+nMVP/Z0WhvCPpovvYTdoQfO+O5xUX7o/SOhVERSmg==
X-Received: by 2002:a05:6a00:23cc:b0:724:e582:1a06 with SMTP id
 d2e1a72fcca58-7253003ea94mr18622709b3a.9.1732947303281; 
 Fri, 29 Nov 2024 22:15:03 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72541847925sm4461764b3a.176.2024.11.29.22.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:15:02 -0800 (PST)
Message-ID: <260151ca-34b9-497e-be7b-35af781a5aab@daynix.com>
Date: Sat, 30 Nov 2024 15:14:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 07/15] hw/misc/pvpanic: Add MMIO interface
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
 <20241129152506.59390-8-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-8-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x436.google.com
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

On 2024/11/30 0:24, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> In addition to the ISA and PCI variants of pvpanic, let's add an MMIO
> platform device that we can use in embedded arm environments.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>

