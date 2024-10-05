Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F353ECF8851
	for <qemu-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 06:13:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swy2k-0000Yx-AJ; Sat, 05 Oct 2024 02:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1swy2j-0000Y3-2n
 for qemu-riscv@nongnu.org; Sat, 05 Oct 2024 02:13:29 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1swy2h-00016d-Ks
 for qemu-riscv@nongnu.org; Sat, 05 Oct 2024 02:13:28 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-20b49ee353cso25912785ad.2
 for <qemu-riscv@nongnu.org>; Fri, 04 Oct 2024 23:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1728108806; x=1728713606;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K47UTTHt5tS3pAusc4ANFv/1D5/pvMB4vNe1vE9RjAc=;
 b=rydWWXS1BEHP9GSF7lrfHf4sxL5/cBX3XW0fNs4C5cwDOOSUSlCyGqMG9ce/ge8Hqg
 wNSDtYqE9LAmJNNNsVJOGm4PES14+n0MZ8+hsvYYiWU7mDEQ3ZRCcsQf3xdpD1JwEjWL
 L6Fzx/1idS0PIB61spocsmWecueCJRcjzocHSc4mlWlaF9EetzAnrO2HD3BGI4/GE96X
 guEZVt3I4zarG9XqwQlEZG2PKFZ/TIf5GA1TMFCumDDEr2RFW1g5a6zqbdD8QCvaTqFN
 +Z1Q1QaffFI9k1V665lIOYFadvNuMac6AjkxNAJTtfd74Et8v4yM7O/CE88Px3WvWhdi
 CZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728108806; x=1728713606;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K47UTTHt5tS3pAusc4ANFv/1D5/pvMB4vNe1vE9RjAc=;
 b=UY4OVEl3qO3EOO7gMs65Dzb3eMU2y15oC6P7PsM9y5/VBdq3Xv5UxmIS9EhisUGPsO
 R89wOzbvosrgaRGw1h9Gml5piVNcBahh6+wWo1a4kYeghOqNULXfzfkIyLjWiCmJcQZJ
 duMvGPi0K6LIU2jJGZW8Xd4ZSPCxWJy0qdo+NerebsIjgHW/qKWN8zfz/iP68JFroFGu
 3RSfzsFeSKV2CE+2y9WiI3r7DAxNp94dOSWRxapN851M+5XeEP746vQOEjUwY339TXxs
 yk8ipgJrMgHsE6fvaK5sKQLd78/FqZCiwz3nX+PLnm6it86V3xyLf/PFQQGrV6+upCTA
 sdSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT3uMviVMsybx3oQU9SGJ6+LFiCXF3TE91iHeySHoQsi059yoz5z2Cj1sGZAbfLJvq2f9ltwI5yU7D@nongnu.org
X-Gm-Message-State: AOJu0Yy9wfC71+fJwNqJHwHF6uvPlQjEH8YZcTi3Aqs7ZG2Rx9G0MVET
 kvgyzPcPjhv9bvPPtqC0spH6HR3QWl9Y92UpPukVnPCe38vPQxK/5TFZQcN1LOQ=
X-Google-Smtp-Source: AGHT+IEnBhq0lPrrIHUMldX/P/YoLplxPKxpDdD60UBqPlapoqg1HrUHX/I6rjkipOrYfZZqKzxo7g==
X-Received: by 2002:a17:903:2284:b0:20b:5df8:8c5d with SMTP id
 d9443c01a7336-20bfdfd1221mr66607725ad.22.1728108806216; 
 Fri, 04 Oct 2024 23:13:26 -0700 (PDT)
Received: from [157.82.202.230] ([157.82.202.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c138d0b50sm7428975ad.102.2024.10.04.23.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 23:13:25 -0700 (PDT)
Message-ID: <2be51c78-a9c3-479f-bb87-3a4c0ddfe58b@daynix.com>
Date: Sat, 5 Oct 2024 15:13:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] hw: Add vmapple subdir
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 Alexander Graf <graf@amazon.com>
References: <20240928085727.56883-1-phil@philjordan.eu>
 <20240928085727.56883-7-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240928085727.56883-7-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2024/09/28 17:57, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> We will introduce a number of devices that are specific to the vmapple
> target machine. To keep them all tidily together, let's put them into
> a single target directory.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

