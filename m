Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7707CDB47E
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 13:35:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qt6eS-00005B-If; Wed, 18 Oct 2023 09:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qt6eP-0008Rl-WC
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 09:31:54 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qt6eM-0004oD-VQ
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 09:31:53 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-5822a990ea6so107887eaf.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Oct 2023 06:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697635909; x=1698240709;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K23Xh8N4kYHlu50jLUbEO25YDhTdGuiVDWvQqAk9P/g=;
 b=pmEsnrgTtoZlYEbH+vlqxxOTrCrnJhqYpPjLjFSPdeA19LsVR+6Q2C63tfrLoNbPyb
 wLfUsqSa/aTqKpZFXduxTFsOnGNjpFxypwZeRa6PJlwY3XeJ4jPeTQH2QJvQeWRhVm8j
 +ir/Xju9n8GS0y8C8Iwn5pirkpsyJtnUnXkpnvgR5X/DvcKdK2b9UOYRt2JvKbsTYQtJ
 F1z3dTe2+wNDIW0hinzIXaR/F7aPUFsrpgxwCNbKGT0ZKKMBVJQRPI0tQH18vftUrEJA
 r1bSJVMU5/6Q9KbCF9enqxwFyfVra2odf0MJ0/eyLRj57hmxiOP11uzE0dmZ7EWhNmjX
 tppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697635909; x=1698240709;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K23Xh8N4kYHlu50jLUbEO25YDhTdGuiVDWvQqAk9P/g=;
 b=ig6IvQSlXPBnetZhyfBjSYcvYIvjE+DSkjVMncjgEan+bVaZqRswrjF/qZLSknc8/O
 JfF+M9Mm3j8tJ5Id13V7yJVnERNeeD9Bq7adnxtd34b9fRpRTKR+80q2tRRIZv4H3any
 +OrwUlwkq/oIf9MxhlFuaeW93fzRv7Dkdz1B3ktGbdx1ZKAxshJWbJCdFYgLweq6zTGY
 5AehIlyaxiEGJNca+2YRfDE3Yau4gejp9kfvgmF0oibkd9yJrjS4dBWNS8Rm0BaYX9KD
 yJRSq9YmqZdkkYAH31RR0FvAZ8Ii27VxNwmdmhT9REca6OchyaBuOR7/nxujpBLbB6BJ
 NuUw==
X-Gm-Message-State: AOJu0YyltPoDVnLQUsVfiu9GE5hHdn4lJEu5L3yTh6LhGOOMJVZrtrAE
 ccxTFQauqHG0BI+UkSJAMoEOSQ==
X-Google-Smtp-Source: AGHT+IG0eX3YM8YbmuqM2Cukx4g0csZalEcgKr6lZIxej6uLGQ/cjyYEYmdDT1FCmgt0L4Pxda+NJQ==
X-Received: by 2002:a05:6359:628d:b0:142:d097:b14a with SMTP id
 se13-20020a056359628d00b00142d097b14amr3909472rwb.13.1697635909051; 
 Wed, 18 Oct 2023 06:31:49 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a626107000000b0069319bfed42sm3412565pfb.79.2023.10.18.06.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 06:31:48 -0700 (PDT)
Message-ID: <ebb52078-2182-4656-a224-928b65124cd3@daynix.com>
Date: Wed, 18 Oct 2023 22:31:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] target/riscv: Move misa_mxl_max to class
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
References: <20231017185406.13381-1-akihiko.odaki@daynix.com>
 <20231017185406.13381-4-akihiko.odaki@daynix.com>
 <a829aa4c-0b6f-40b9-a357-99c43d066f3b@ventanamicro.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <a829aa4c-0b6f-40b9-a357-99c43d066f3b@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-oo1-xc2c.google.com
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

On 2023/10/18 22:01, Daniel Henrique Barboza wrote:
> 
> 
> On 10/17/23 15:53, Akihiko Odaki wrote:
>> misa_mxl_max is common for all instances of a RISC-V CPU class so they
>> are better put into class.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
> 
> I'll repeat what I said in the v1: this patch is adding an extra class 
> parameter,
> an extra param required to each class_init, and an extra CPUClass cast 
> every time
> we want to read misa_mxl_max, all of that because we want to assign 
> gdb_core_xml_file
> earlier.
> 
> If my previous suggestion of assigning gdb_core directly into 
> riscv_cpu_class_init()
> doesn't work necause we need misa_mxl_max to do it, a good alternative 
> is setting
> gdb_core_xml_file in riscv_cpu_post_init(), which is executed after all 
> cpu_init()
> functions where we already have env->misa_mxl_max set properly.

We want to assign gdb_core_xml_file *earlier* so assigning it after 
cpu_init() is not OK. In general it should be considered unsafe to 
initialize a class variable after class_init(); otherwise other 
subsystems cannot know when it becomes available.

