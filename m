Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3834BC3DA4A
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 15:17:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sYS7P-0005L9-Ar; Mon, 29 Jul 2024 11:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sYS7O-0005Fu-9r
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2024 11:16:58 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sYS7H-0006Qb-VN
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2024 11:16:58 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-368712acb8dso1416452f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 29 Jul 2024 08:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722266210; x=1722871010; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xvL3BQalaYHs4MQ6olvlQNu2RsDNFqFTsx9/slDdZE4=;
 b=Bb74fsVcwaVXS2y+YHOJ8zvr/cVCAAVZITX8cLoX4KhQ6H+0bMNm9FMWQln9/t6qnZ
 LRU6vncZmGCRNUt2R8ykIKTwnpWj7ec1Fp2GPlmmNuu1f7V6ERe9MbV/FF4fd/VZpHQ3
 9d6SGo5fVPzf1HtWGeWFhX/S9uNuo1l2lepw8G45qGKBqhBaJL7lcXhq+fimT8AACJ4A
 XYhJPF0qWLlp4ALLmpV0s+JbvI1sc2yWGhv4w/rKDo3n0pH2aQ38OWUv7eS8jzo8nHp7
 DPaByiY/W9e9CVf3VuSbxmGawtw5mVep5SWcT20QoAkM7aXJuPQlNSxKPyNSTj6I+CCr
 J91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722266210; x=1722871010;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xvL3BQalaYHs4MQ6olvlQNu2RsDNFqFTsx9/slDdZE4=;
 b=SlGJlQZ5gzOPNPqc4v1ZLF/FMaLiWrlvBPDaSvN/YA30mr3G1ybu803r7SvYK8hklp
 +EwM/tpTZZWz+ij9pzmPauou57yMbthKWPmwaikLEdlYY+GfSqmvalNnm2UZ7/Q7tyXr
 Mfz9Oe/vBKoimSL+I4P/8t4eLALqo39o7Qgf5Gn3yRhNsnhuFK+vJNuutO//xgxFMrMd
 rvJzX168mby/NQKGZZAYrB2qZbr51xhzpN1rOMB0cp3UlzAaEEL7+LWXrzSn6X8xCZq8
 O1mPd/Y9+aOE1ERxSoutNdFHUO4HFAAUO+QlXth4fT2IsBjgQg9+R+TyG8u7kCw6gOx1
 frCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlzL6f0NKtTrFuq51WCAffPEOXryZYww0tPGWDdLFmfBhFXZ13WnQChyk32gxyCwd1N5zHesWgVTcOGjKdv5Nah4CG0A8=
X-Gm-Message-State: AOJu0YwvGjzwj0onHDWR57Mf52bgx3xdq/mWHuP7dgNJmKDjo9uKir4K
 KzTpVuu2tYGQ4103QpqY4NM1GEFIwixqT+1xtMnJr7fEhbjrGOkNvJmes4R0tlE=
X-Google-Smtp-Source: AGHT+IG6WKzTJHL+PolVkv8m8lc0rPpWUSEcyIp7ciOyFdIjfKhGp9MSOUfJ0ZsJA1lOLg5pvdmCkg==
X-Received: by 2002:a5d:6a02:0:b0:367:40e6:46bd with SMTP id
 ffacd0b85a97d-36b5d0cd807mr6028852f8f.61.1722266210106; 
 Mon, 29 Jul 2024 08:16:50 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.173.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b368622c3sm12483658f8f.100.2024.07.29.08.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 08:16:49 -0700 (PDT)
Message-ID: <b6e1e3f6-53da-4771-9a09-a6a60da626c9@linaro.org>
Date: Mon, 29 Jul 2024 17:16:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] contrib/plugins: add compat for g_memdup2
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng.cn@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-arm@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>, Song Gao <gaosong@loongson.cn>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20240729144414.830369-1-alex.bennee@linaro.org>
 <20240729144414.830369-14-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240729144414.830369-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 29/7/24 16:44, Alex Bennée wrote:
> We were premature if bumping this because some of our builds are still
> on older glibs. Just copy the compat handler for now and we can remove
> it later.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Fixes: ee293103b0 (plugins: update lockstep to use g_memdup2)
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2161
> ---
>   contrib/plugins/lockstep.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


