Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEF5C83F3F
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 09:52:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qd6G9-000402-Nz; Mon, 04 Sep 2023 05:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qd6G0-0003yT-B3
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 05:52:33 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qd6Ft-0005OB-VX
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 05:52:32 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5256d74dab9so1668486a12.1
 for <qemu-riscv@nongnu.org>; Mon, 04 Sep 2023 02:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693821142; x=1694425942; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PbWx9BTVt6IZAk41F6keTl3viLzVQvBCWj7quW/Ekx0=;
 b=TMlXNP0QchhdT1tAwE2+MU3wJwNTUBo8hk+zGsfZstODVoxfvR//Dg25Bgf4uyU1So
 tQxLxCCOsLOvYmH0mXHamWcmwV4Amil0i7JLZ2gX2l/K3uRJoYpGqvARzbBRCJk1pEeV
 bXnncMQGgZzk8ijiDj/5mp/9DxJkgQfa+tkmiDIyiUTnmFj7UWwx6AqZ4v1Eq30QJKLH
 HzqFOCR0EMj0YIx7ijCQO/mM8s33a3uc5Sfv5OVaftunBUV/OzM5d53pUykKlu4jvxXK
 ZVLt9hX0JFvaZYtafWVYFnGtTKeW8QHZv6z4LcGXHYq43ssO+LJZbXL2rkOQfDmV5RWw
 d5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693821142; x=1694425942;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PbWx9BTVt6IZAk41F6keTl3viLzVQvBCWj7quW/Ekx0=;
 b=A2nFd/TkPST2UsfAjFSypvIBVxQSTBn7lkmZqiF6VVfWnChme/UdDafyGwpckxylQC
 1AGftLGCBGyXoojvsiz6yTEvC9OzX70W3A9d9i4ukTStYMM5/PHDrnuy1DwRvTdL9yuz
 qdWGLyDa1mSYWK5IPXmojiXMNyXvPuubS9kwwUw6tbx/n0kJbgaZ70iTn2xOWIyuQnG+
 GBIh120GKcxQrkTrMsD468s+Rg2+REQSUq/GGFwpO53ESzv+tzE9Jpo7eGSVTZcezY7x
 Av8wJIO2WI4G4RA6chvXbGOIu9EdNcyI/zLnmuQm5w78R7OoE/KR4XMY4itmvhn+QHoB
 6mtA==
X-Gm-Message-State: AOJu0YyBGTlw3j9rUldJWfQUr6SnqGc+hl7PQ5g1/hHAdPya7+mVW2Ti
 ieTAtync2jyeQBN25HeR64abcQ==
X-Google-Smtp-Source: AGHT+IEn/EYPM8FkYGNw/UMiwOiYdITtzlKFwWtxTtpnIkG3IAuZVwB3NelMjbkjWtPW/X9N+5iVtw==
X-Received: by 2002:aa7:da45:0:b0:523:c19d:a521 with SMTP id
 w5-20020aa7da45000000b00523c19da521mr6492059eds.40.1693821142480; 
 Mon, 04 Sep 2023 02:52:22 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a056402164200b00521953ce6e0sm5592012edx.93.2023.09.04.02.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 02:52:22 -0700 (PDT)
Message-ID: <02cc70e4-31cc-6e0d-0e74-e4efdc5848f6@linaro.org>
Date: Mon, 4 Sep 2023 11:52:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 4/8] hw/core/cpu: Return static value with gdb_arch_name()
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20230903043030.20708-1-akihiko.odaki@daynix.com>
 <20230903043030.20708-5-akihiko.odaki@daynix.com>
 <fe9021cf-727f-aa8b-c22a-7432ce928fb6@tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <fe9021cf-727f-aa8b-c22a-7432ce928fb6@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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

On 4/9/23 07:54, Michael Tokarev wrote:
> 03.09.2023 07:30, Akihiko Odaki wrote:
>> All implementations of gdb_arch_name() returns dynamic duplicates of
>> static strings. It's also unlikely that there will be an implementation
>> of gdb_arch_name() that returns a truly dynamic value due to the nature
>> of the function returning a well-known identifiers. Qualify the value
>> gdb_arch_name() with const and make all of its implementations return
>> static strings.
> 
> Why it needs to be a function, can't it be a char pointer
> initialized at the cpu init time?

For x86_gdb_arch_name() or ppc_gdb_arch_name() we could by
moving the #ifdef'ry, but for arm_gdb_arch_name() we'd need
to add a specific class for the iwMMXt CPU. Not sure worth
it...

