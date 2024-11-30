Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305A9D735F3
	for <qemu-riscv@archiver.kernel.org>; Sat, 30 Nov 2024 06:19:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tHGox-0002Vj-HV; Sat, 30 Nov 2024 01:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGor-00023q-KJ
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:19:07 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGoo-0003zd-VA
 for qemu-riscv@nongnu.org; Sat, 30 Nov 2024 01:19:05 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-20cf3e36a76so23290295ad.0
 for <qemu-riscv@nongnu.org>; Fri, 29 Nov 2024 22:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947541; x=1733552341;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F7eEVoPnO2WKUyPFuL4ubctiQXe1HKtwH5FMNFuU+30=;
 b=TIxnsgtVri2untZh4/5G21XY7/c7cPfWBY+XF5dyH86Zl4uunz9/cU/DPLMvXECxKq
 PK1Q+g9XSnL7Byn3a270S2yZ0eXa/nBTY0Hv5TTbgq16lVQkCoRPcTKUYECqbkJieiH8
 9Z24PjOPJj0bNPa2Vsi1bqyuirard4xqsR2nZg6mL72YY85BWjMOaWNJYBkbrhgFLGQ4
 a3Jfo5MlLMGJbQfV+ZwsTaKMdifsJpxd3Q6RxIswIEeBdiqZ7SQhyKDqcobAfaQ0g5fz
 4vbeXIeQPmt78oyvBgkyU8Nl/xQskYRBL3UN2Xh9PUCE8DQ95SS1BoYYJsUTU9iJqPaL
 kqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947541; x=1733552341;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F7eEVoPnO2WKUyPFuL4ubctiQXe1HKtwH5FMNFuU+30=;
 b=jxQeYoTxtu5/X4oTgvCH+FGhXmb/cOzKE4/emmS475M2wx6fOzqRXHq626AOMyvLyq
 /tlOc21QNZC0tVAUQ5PSLWRR8gBKv0DAOuyLZg3Chp47jIR1NgWSjkuqCAzN3L9UStcO
 5d3Tj6nNlJPE9/JGE1F3R6CXmwrqh/Oej0Ws+wDP8Q00Ftql7NWGk+Fk4sEiffqgMzwx
 K0BhmTbmwWqhCz9kKQdr9ogi1p2eV+qvrAaEg3yj78PYpq8fpmJ55ulpJytnjtqIHubT
 wRmmNZVmPGrpu0GcYpc16dOu3xCIG8qsVjQp3Uh5ufKoAjyqDAFRB1LjDEfY9NE5uYLO
 KjMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVsCvcwTz3nMpwi8lf7iG5nHv86O8O5YAhToEG4UUYE6VaRZ2hsSEXfnZFkm0Fp7fzzs5PDpyaQYeZ@nongnu.org
X-Gm-Message-State: AOJu0YyGy3HEn2ykc+9MwvNn3Qu/AePe1AJU4n4Kv8b0DQZGc/5ajYev
 LJoUAeHHyaIYKmwi6CJ9ev6jVT5HNk+OU1QBb1PBru6NS/azsAODHROvvhpwM1w=
X-Gm-Gg: ASbGncuEe62gPrDKVzlaqFLnG7aG8fl0bPkk+7nwMyejDP49YYsIGbi8NquQLBplz0k
 I9+9JoKQshSQI9WSi8EICE7+hWhMObW6i1CWDt4PrzPdC7OzPnVUmGH8oMG1dPAELPRli5dga1D
 4hTrEcMDawwWpez777sHmyiQhTrdFC2UQYUyO3h5xoK8Aj74YrVn8mSd63vk45boxo39nnCsRBH
 V68sw96/tL1DN5OSkczhrVmN6tN33uSnxuB+OOPTnyY++hr6UG5d8tGCd+pHzA=
X-Google-Smtp-Source: AGHT+IFLqqaBUgl6riliWebUXPUYDh35roHwCuLbYjrzZVvhqmzY0tnQgLHbDWt7XU8ZV0r1UbInPw==
X-Received: by 2002:a17:902:f60c:b0:20b:5645:d860 with SMTP id
 d9443c01a7336-21501d6192bmr215183985ad.36.1732947541473; 
 Fri, 29 Nov 2024 22:19:01 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215341064e2sm32108515ad.137.2024.11.29.22.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:19:01 -0800 (PST)
Message-ID: <64c65beb-f79f-482b-b239-f050960b01e0@daynix.com>
Date: Sat, 30 Nov 2024 15:18:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 13/15] hw/vmapple/virtio-blk: Add support for apple
 virtio-blk
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
 <20241129152506.59390-14-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-14-phil@philjordan.eu>
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
> Apple has its own virtio-blk PCI device ID where it deviates from the
> official virtio-pci spec slightly: It puts a new "apple type"
> field at a static offset in config space and introduces a new barrier
> command.
> 
> This patch first creates a mechanism for virtio-blk downstream classes to
> handle unknown commands. It then creates such a downstream class and a new
> vmapple-virtio-blk-pci class which support the additional apple type config
> identifier as well as the barrier command.
> 
> The 'aux' or 'root' device type are selected using the 'variant' property.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>

