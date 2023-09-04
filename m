Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F228C83F33
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 06:02:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qd2er-0001XS-Qu; Mon, 04 Sep 2023 02:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qd2e5-0001Pw-TY
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 02:01:17 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qd2e1-0003e2-Nt
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 02:01:09 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-573c62b3cd2so59779a12.3
 for <qemu-riscv@nongnu.org>; Sun, 03 Sep 2023 23:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1693807262; x=1694412062;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PKX2wX1++1hQlRMPiKnO2ihU7HrlYOE5r5rNNc37le0=;
 b=bMaERcFP5Htmkz6/yglVJIbzX6lmolws0wx9VPJcwYzmqSZkpOcWOjNUSU9AETzxhS
 4lTOKobIDADlUkU+EkJZF/vGyB1EL916RVDMpEf1seTwawJsWHrwsBdNeRxoPQnK7DQ9
 EQqHYD6THrnZB+ofXv4eWTsZoPsHBNU5OdJDZcN+RHrIUtfFeB34xMynNOjMIhKKyCkF
 6tAFeAydNCEaRcnBltPsiUc5r/JrOXwskWHUQZ1qtFTqYtNahI9zjzXwOdHzIlStzNVT
 KIZfVeM69/5mUfPcL159FmD15bepvV9eD06N9u9KxM4Su9X7f+CTrZDsdn7bGC5IRAYX
 Ad6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693807262; x=1694412062;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PKX2wX1++1hQlRMPiKnO2ihU7HrlYOE5r5rNNc37le0=;
 b=WclakbstExh6lDxwcIaBZUEmfq0rdhpM7Nvb1IYeXD/fUMhTjPxJ/oM9Q68DY1v0uP
 3NP9vZO4b7KZPHZWi5iRwZKQ54o1B0I/2BxMZYP3m58+FMr/LzSyaMnaFN2BruD6DLal
 AWQHlMNyIQ3K5KQeLuhyUjKIZ/J5ORedE/dSzqIGFETlE1mdL++o04qJ32a25oE+EoHt
 PkcSR/Pms39G2HNEVf43Kcza/k3s2z/0mIaFrnA5piKj9YrQ8bcI7vflnYE6d/ITxSKA
 MEoTaZwz1JRgvwx//faCfC76hRXV6h2Yzkpkbo8CVVbb1wks23V54eIODSm/1l1QUe7x
 vOVQ==
X-Gm-Message-State: AOJu0YxHICEkh18+pbV4aqyixUzqpUqaMRvZGTCshqQUk4eIZsgSs9ze
 josqxHQmYfWiie8FSmZWRIfbZA==
X-Google-Smtp-Source: AGHT+IGeWiUE/6ZyA1xR5+BfB2DnOzt0Jjn9WjzH3OaZA63fXHBY2XDg8LbblsX1jETDeKa0YBskLQ==
X-Received: by 2002:a05:6a20:6a1f:b0:137:2f8c:fab0 with SMTP id
 p31-20020a056a206a1f00b001372f8cfab0mr8424857pzk.49.1693807262231; 
 Sun, 03 Sep 2023 23:01:02 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a63bf4f000000b00565e96d9874sm6076958pgo.89.2023.09.03.23.00.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 23:01:01 -0700 (PDT)
Message-ID: <64f2030b-2d56-4ecb-9b8d-fd4f3a8eda68@daynix.com>
Date: Mon, 4 Sep 2023 15:00:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] hw/core/cpu: Return static value with gdb_arch_name()
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
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
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <fe9021cf-727f-aa8b-c22a-7432ce928fb6@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On 2023/09/04 14:54, Michael Tokarev wrote:
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

There is no real reason I guess. Either is fine in my opinion.

> 
> Reviewed-By: Michael Tokarev <mjt@tls.msk.ru>
> 
> (What a huge list of recipients in the Cc..)
> 
> /mjt

