Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1571FD735EE
	for <qemu-riscv@archiver.kernel.org>; Sat, 30 Nov 2024 06:17:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tHGmt-0007ut-86; Sat, 30 Nov 2024 01:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGmQ-0007fh-F2
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:16:35 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGmN-0002xL-Cn
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:16:34 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-21271dc4084so19254335ad.2
 for <qemu-riscv@nongnu.org>; Fri, 29 Nov 2024 22:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947389; x=1733552189;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iAADfka+wJ/6sNT0BcTzF7GinB4EOzBtyw1Ynff8yIo=;
 b=Pl49k1B7pvKog+SXw0l3/mK8xGj3Z+Gw5RyCPUF/V4Ts6517lZyARrLfSdssUNrD/u
 +ELOuVOivEG8kDuFuUWoA8i7G94wY0pbzocnMNwS11PnZuWJrS+ybGdMdpb9n6J0dx7v
 basYQOxYiY4PvAVMPRTUE8DOy+d8jP5I1OiGb3RcsvV+FyG/gJmi9SVHvhF1Kx7ZKDDy
 G1xypxl+J4IIxT0hPRxs5SSRJnIGn/DZW/j2g7xKaIEYMcCJacHeAEltnvL5qlEuISIg
 MpiKUcN6p2LBBbi8awUR0WO6A8PrLNIqKxwPHTTaC7FFWxtb8Llb6bK2dAKqn0h2fdQU
 jFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947389; x=1733552189;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iAADfka+wJ/6sNT0BcTzF7GinB4EOzBtyw1Ynff8yIo=;
 b=EV0flYf2HPqAGrkHhjU0g0si5umdbxDPx6KDypGNV9bFA19cQzpvwZ8govrkq7AzMN
 B+wBmojaZDaspLwSLNFk1ipRKTQACN81dBtNFqHuFpdW/VAMzJjfY/S9vXVzT6V+dIuT
 1tKb/G4HZAb0Ff4KmV3RpV2BgEw3kqeiYE96dplqgCjIsb9ZXZv8q0D58nXEc/may4VF
 xHluqFqFhoODmM0/0VRBvOFBryyIi+P9l3dI/HGwFyu7LUDx7m+IDIeZCHYbMg4Cm6KK
 Xiu2t7M5kQTT9gB7+fPApnuOigdINB0Au/DlOSGe/VsRjavIWcoXtIBoSMI8FdisN4NL
 ClCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuMEUaKQ+MmiwfGwUQJ/X7L7qTlEfQkeJQqtYbSC35Uols8M5bskAz6MYCFxp0z2kV9M7kidizYyTx@nongnu.org
X-Gm-Message-State: AOJu0YzzgcMRq1Q39ztKgeaYiNRpbdEGevO2ZUPDvSfCjQABDcKut/ye
 b0Es5DF6cRhqf1Zpyzn6u//UgQS2+0gFhArx6Fjjywp6HYApt9MoAwBRm2ju7WA=
X-Gm-Gg: ASbGncu75z8fJ5zPCgsFJ3o+vxxdVRJJ5oBb1GOQ5rrPGCPTfSyJiLQ/tUI4ZYaNkyW
 6O1jUxnc3BVxl9dRyzzFjCuUMSn0wRp5lqlPGg4xZ8UDeDOQ/u2bs2OwI0MQH7BwW1rEAXAO5MW
 v7sMWb/izHShGaCt9debWKcx0831iKfI6oRa7Fy8721e6GBEN8PdwvrACStk1GC8GDxL2sx7nZh
 GBNQ20Fylh/N4jKN7uB53nYVbGnb9+VLFctQhM/vlkMFWD/D1l+UvTQLpZJGe8=
X-Google-Smtp-Source: AGHT+IGaaoWFFFzAjAjsqvjmMY9EtET2q2/bw/RllNwXGeAO7t4Hw/9L3k4/iRSduOdhpfyIlhsbGw==
X-Received: by 2002:a17:902:cec1:b0:20b:5b1a:209 with SMTP id
 d9443c01a7336-2150108cac1mr201300605ad.9.1732947389627; 
 Fri, 29 Nov 2024 22:16:29 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2154be15034sm15955885ad.205.2024.11.29.22.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:16:29 -0800 (PST)
Message-ID: <80bc3a21-9b0a-422e-a6dd-c58d39c7441f@daynix.com>
Date: Sat, 30 Nov 2024 15:16:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 10/15] hw/vmapple/aes: Introduce aes engine
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
 <20241129152506.59390-11-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-11-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62a.google.com
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
> VMApple contains an "aes" engine device that it uses to encrypt and
> decrypt its nvram. It has trivial hard coded keys it uses for that
> purpose.
> 
> Add device emulation for this device model.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>

