Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C03FCC6B19
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 06:06:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGs7h-0007ly-6S; Wed, 14 Oct 2026 02:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xGs7e-0007la-V1
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 02:05:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xGs7d-0005SW-Dg
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 02:05:54 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so30347715e9.0
 for <qemu-riscv@nongnu.org>; Tue, 13 Oct 2026 23:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791957952; x=1792562752; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=I90z3+TIuHQyFon2sTpadMb2arK3M8TUwhpq1HNaNVc=;
 b=lsEIHQlmnKD7fISTwarJ4A8phsHfpMqjPtDs9HpvX/VjihcmOpji7H80YmBMhhrSft
 CUdwPxPD5PWiecvfqsjn22aVAmR/NBpzQhwRtm919GjWrhX6/wFlGUP+3sUnSI07YKRN
 NGRbwEuRvyC/mIPYxT5jf9IF8+xwpJCuWqUMTrpNWto8B7kh/xCtBENIhm5JJU+pNulP
 ZkD2eOk8VWUJLVY7LGVVolKUCc7TFPVjW5+s3vIMGHDm5B4xRdYPabepNrztqc2s430i
 ryeCNG/wvV+9sl7842p2PNmaMhWpO4gIukPkxSjVWJVgjxve4j2AITasvoi/YNQjyb8Y
 m58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791957952; x=1792562752;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=I90z3+TIuHQyFon2sTpadMb2arK3M8TUwhpq1HNaNVc=;
 b=UCk9X1G/HcRHLSXP9nfDxj/je/7y3Zm0pEtOqxPYgLMg/F3NFLaImS9hZE3RPIj2aP
 fJ/P4iwNBLDqkJiaDCPsZ0aUkrZ8m6PEr5cRskiZPzIAA5VvszqvLiiJiXIaT84KeE+z
 yzNEjT39oKD2fnrx9yDpgNruRD/eAvfpnqBUTQ/j1/nJJTLut8692B5zDVoMKWdHnD70
 WRMCrYQzql0RfL2zTFnf+sdoyCyvBYePJa9kS+00IOyqCt+5Gc0JDxOzZmrUOBD0Bc7Q
 hbGovZd0e8iPXb8Jwdgbkz9+ebTsR/KlsZHGVP3thAv8BClHVgNFPvcYHXIm/SH5TJ5J
 8dzQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx1jXv+VgqDyiHfzKK35sD8XG0pTWbaFl1ep/eCKFc3Hf6LXcfhN9mCte91lqUrU8ovKZ3oMU3DGKTt@nongnu.org
X-Gm-Message-State: AFq9FYIxbrUQ0igXkAhAwNiXo2XXnNFJKPvYN1QdwlGKIuGp//roXXm2
 D5CbF3ViXknjFitnOr3OY0RuPijKENQz4OUm3hQwYICKG/4YGRAgaq/d2DaJDJZd878=
X-Gm-Gg: AYBFou0xNtx4VtT8A7fJs5D9OcmSggVVNJAaSTb8QFkAjgLRS9NrORoQwh7q83poPqn
 Fg555YKTFYsOEiiBODVJQmkn0GS6pTZ2o4/W5yPmbpCfdgcRVUiQun1NtWHoS8igBHEqArIPMRb
 OX0b4MCPOmfXLjxaCW1H+xngBugzrYJyPPx4yHpK3TB9IuA1U00QSukbMiNxMovOGqEXZa3m6vz
 iEri2g5hNzQV6pPLcPsEzj0EvISzdV6PnMfW6xEtmNO8Zd5asJGdvgnmkGmfq+HVa/D5A2jTMrX
 NMp/aI0UfaSrLCbXXHf0z9Tn+e8bMGOXl2PprTtVZ4ixbCDG1qjXK01+O5Rzf5xT2mpO4B42n6n
 881X1hytcqIXRG6zsJOb5xrNMlGo5a0XGIOMrNYfmEyyOKWiv9LW1Sj0BW2E5JkWOROShtQJLSm
 830o3lrzeH2B/l9xUCrB5pgoV60vkwyxve0gbU8UNyPtt2o+X4QuaovkF11jQqybfR9dEd94NtP
 o5eddoRaFtjqmktVvtpgR9D4kMG86oivlt4oColyvBBQjz46EEychYFoq4zDdn5wyU=
X-Received: by 2002:a05:600c:8518:b0:49f:cbf3:551c with SMTP id
 5b1f17b1804b1-4a18e4a8ca6mr266016225e9.12.1791957951596; 
 Tue, 13 Oct 2026 23:05:51 -0700 (PDT)
Received: from [10.86.151.227] (ip-109-091-152-129.um37.pools.vodafone-ip.de.
 [109.91.152.129]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a195002123sm449220435e9.1.2026.10.13.23.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 23:05:50 -0700 (PDT)
Message-ID: <2e8e75fc-6622-48d3-ad8a-3072fd1c573c@linaro.org>
Date: Wed, 14 Oct 2026 08:05:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tcg/riscv64: Fix vector constant matching for logical ops
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 "open list:RISC-V TCG target" <qemu-riscv@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20261008181647.3015949-1-aurelien@aurel32.net>
 <118805f8-bc4c-4600-b156-5b494a840ef5@linaro.org>
 <asksJ0sjVi9BZ5m0@aurel32.net>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <asksJ0sjVi9BZ5m0@aurel32.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 10/9/26 20:02, Aurelien Jarno wrote:
> Or maybe you just mean to replace the check by
> 
> +        if ((vece != MO_8) || (val == dup_const(vece, val))) {
> 
> ?
Yep.


r~

