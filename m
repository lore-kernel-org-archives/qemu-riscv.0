Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E91D735EE
	for <qemu-riscv@archiver.kernel.org>; Sat, 30 Nov 2024 06:21:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tHGqf-0004VY-V5; Sat, 30 Nov 2024 01:20:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGqL-0004OK-Ha
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:20:37 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGqG-0004YD-0d
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:20:34 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-724d8422dbaso2196691b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 29 Nov 2024 22:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947629; x=1733552429;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UaU0zOmZ0YAsn6aSvaKXwr7t6amJcWxMlrxWLIfv/DA=;
 b=Acrcms97wL2b61kWh10SRWWr9Aalck37P3b8Pec2gIOMYv7zTKZuGFYMT9yh/V15GA
 eB5x7v2LZkhJOiR/Bw1eFWSDmaQ2mrdy+PzkDiEDlzvtWtncU/3SFCZHvVB2P3RVq8kv
 nGjA/hskohvkbsjHYLNv17Bs3fQommrc72eB+vNVwAxuOqLvbhMZz5ris0dQzMXQJYWi
 HwhdW9By851I6Iooqem174mbzRgLGeW8y9gyTpBmubA1SxO/2h/t8uDLoE+PPXkwJQ8c
 Bm0DABxWlbzR1yRZapD2xEiRyvUrdWU2/ULZimIq3Imc/j+hUlYpDzEatLcUzSLPsV9H
 bl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947629; x=1733552429;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UaU0zOmZ0YAsn6aSvaKXwr7t6amJcWxMlrxWLIfv/DA=;
 b=O5eZgd19d4V/wknIRkA14Toh+DzASCK8EZpUUDubxqksJA58/D0Ct4zWyOf4XN0gz7
 CtcwGPNqSC+hm9ZA7ZbJljSECxA/8CQwygC2E/ksnb+MuMLksq4n8SAsGqJt9Kqrm/XN
 xcmaXiT0w6Aqy8EjK9QbPUf665SW46ntkqoSUKLat3C/SC5QNWmK0IIdPfJVOTtNcoKv
 rEDovYL0nVhlBEyE4iINbLIV5JCbICoMJK4Qht/Z/b6mjiqqVTrhD13Zd1s3Y+BfxVdZ
 luKDhMP6Z3xZHY7RA6/k/zkdFa4h+gcrUu6l3sZTEfGucxYV6hradigYwVffLgke9+nr
 mPAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+/xrEGzNmhqk1ePWGe+C0T0aOAxBXgdN8/S3jpwfI9yyoapIa3AqT6NjS6+Ejfbvx3mrXelgKy//w@nongnu.org
X-Gm-Message-State: AOJu0Yw3UYVi1tA9vKsLaAQvmZAWyoQPT1WZujR/avy8OPiOk4rwmzTL
 DKmTyzEXwtV1Fmy6BNV/qVdoRWlVnvFrIt51IO6JIWkhKRndZD4ybAUN7oCHZ34=
X-Gm-Gg: ASbGncsrTODhvk+ss1IUeWRXnvB1AbkzrdxjfmAzyCFtEXRt75bzOnC3/UR7fVSWAgr
 M+CIh1fmtmlmyGUZzQpDzNCFCZdvl6ajvy9HxMpbf+53a967mgYqExJuGVDPBu/R/hmK5TCBzIC
 pgucbevOs0B+jQ9ELehKh1qo00tq8SePkUwXtDxpdw4VNPy5Tprq7ZToU6nToVdXtuypY6ZH8fE
 wiEFnlYLi35CcYoMNEGgM3+iM9oj2+LURwNMv/W5jm150IaKElNuS9+/dgXtXQ=
X-Google-Smtp-Source: AGHT+IFQ+XVzhuNnk7Hti8MqwjGeN/nW20jZod/aVsCJJ9GiW94uSdKVt84qmOWnGFPLxiyC4OABjA==
X-Received: by 2002:a05:6a00:4f88:b0:724:5aac:1687 with SMTP id
 d2e1a72fcca58-72530142fcfmr20927802b3a.20.1732947628647; 
 Fri, 29 Nov 2024 22:20:28 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725442c086csm4374934b3a.189.2024.11.29.22.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:20:28 -0800 (PST)
Message-ID: <1e437634-ea0c-48cc-a2ab-2ad3c6256fc4@daynix.com>
Date: Sat, 30 Nov 2024 15:20:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 14/15] hw/block/virtio-blk: Replaces request free
 function with g_free
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
 <20241129152506.59390-15-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-15-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x429.google.com
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
> The virtio_blk_free_request() function has been a 1-liner forwarding
> to g_free() for a while now. We may as well call g_free on the request
> pointer directly.
> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>

