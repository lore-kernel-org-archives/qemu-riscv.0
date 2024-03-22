Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9336C54E71
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 08:51:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rnabk-00026H-S7; Fri, 22 Mar 2024 04:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rnabh-00025h-PV
 for qemu-riscv@nongnu.org; Fri, 22 Mar 2024 04:50:33 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rnabg-0000hM-2g
 for qemu-riscv@nongnu.org; Fri, 22 Mar 2024 04:50:33 -0400
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6888E411BB
 for <qemu-riscv@nongnu.org>; Fri, 22 Mar 2024 08:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1711097430;
 bh=1NPyyWq4majbmi+xcXjpt8YWDG2Op46iJhonn7+pXvc=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=IBJPCznHxTGyJd/Na195EZQV9si2GNKxp6AxoHn4KW4wjhyCXrd4KBknJXR+gQr1p
 WJAdBtuayhczP4gddBYElGtja8+6v7H9J31aMClq5uldO4Vol8Q5E/0vCv+dSWkXrU
 BN8rWLc8PegtZ2wlMhn+73D3fKmEq1B+dftJuhMqA98jrRjSizJavWl1r0C6z1QKN/
 j3YnIFHY9ypx053U+RbuMBYCoKbx6yCwqhMsFm/YoHFsqkdwo8s8koI8DogmwoYfq7
 AW9vyjEp2I0nndOQUwqZAjMKc9FLLlbbGiOv4czT9chdYwrThbvPX3sizlgJMpNbN0
 nztpaOLAwEv6A==
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2d48af389acso15074301fa.1
 for <qemu-riscv@nongnu.org>; Fri, 22 Mar 2024 01:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711097429; x=1711702229;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1NPyyWq4majbmi+xcXjpt8YWDG2Op46iJhonn7+pXvc=;
 b=twRA9piJuszqY1BcVTY5LB2Q6X5QJstcxfRB5NdApe55iYbgWMLEChAtiAO2yjuI/g
 hsFT/areNVXzczV3HLTHnzDVW28muA2cvBGF9Vu4tSHACdfmNyiYxRty+hmSyzQBAbLG
 JdFUW+uoyBjQIv68zkpMHRNaP9B8eBs8r43PP6lni6wDgr/Q0Bd/bzho7LsV+e0yAdlh
 axaFlIPrwyvNfXw6GZ/VJZltTuvFXGrBETKWq2yzq67BCZrIXFW+kjwFZI6PTGpKCrgv
 io979pgAjy7Pep0o7j1IWH423mnynLvLOIMkNI1kdsqVivdzd/Vkym42oDUHmMU+6+iM
 ZPtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjOI+UODpmG1tWylZuiOXqp7EI8waDF5dyDk7/or4lfe9nfyvdgwHiGKxHvvYBJZfLXK2VyvXONaXT0CbgVFVEIyXA+FM=
X-Gm-Message-State: AOJu0YzHAHBVV4YZX09ihvNeAeFvPsDGu+JokA4uekgBYnMisgyW+mo+
 o31BwX/iauRunmb1tgSOzia9AmfbXocKuhry2r1Wbp2soBNUNbgRzWZZoVF0N/sE9eEltQIZY5Y
 hmelIksck1txgbCHj4ZUOXILyf37bTiHNO7U8JmwYH9WvEq9zk5TBK7G3+/S+1338OuRP
X-Received: by 2002:a5d:5506:0:b0:33e:6ac:691b with SMTP id
 b6-20020a5d5506000000b0033e06ac691bmr1064542wrv.9.1711097408278; 
 Fri, 22 Mar 2024 01:50:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf1SKFbtIZlVsgcDgnCK3o0R6C9ULWWIbfzhDWzRDzmP94uEOEmxqdwaBYKvL89leuB6rfEQ==
X-Received: by 2002:a5d:5506:0:b0:33e:6ac:691b with SMTP id
 b6-20020a5d5506000000b0033e06ac691bmr1064516wrv.9.1711097407859; 
 Fri, 22 Mar 2024 01:50:07 -0700 (PDT)
Received: from [192.168.123.161]
 (ip-062-143-245-032.um16.pools.vodafone-ip.de. [62.143.245.32])
 by smtp.gmail.com with ESMTPSA id
 bs20-20020a056000071400b0033e18421618sm1571856wrb.17.2024.03.22.01.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 01:50:07 -0700 (PDT)
Message-ID: <ebd63aa1-b4e7-490a-bdef-d952c8e37c47@canonical.com>
Date: Fri, 22 Mar 2024 09:50:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 2/2] hw/riscv: Add server platform reference machine
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: pbonzini@redhat.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 andrei.warkentin@intel.com, shaolin.xie@alibaba-inc.com, ved@rivosinc.com,
 sunilvl@ventanamicro.com, haibo1.xu@intel.com, evan.chai@intel.com,
 yin.wang@intel.com, tech-server-platform@lists.riscv.org,
 tech-server-soc@lists.riscv.org, atishp@rivosinc.com,
 ajones@ventanamicro.com, conor@kernel.org, Fei Wu <fei2.wu@intel.com>,
 Alistair Francis <alistair23@gmail.com>
References: <20240312135222.3187945-1-fei2.wu@intel.com>
 <20240312135222.3187945-3-fei2.wu@intel.com>
 <CAKmqyKN-Yj-HZrR2MtxD2jC=JR6nFn5cEq866EXm0OfaEydXsQ@mail.gmail.com>
 <cfac29ce-f353-4bbd-8e8d-4a7d40bf80e3@linaro.org>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <cfac29ce-f353-4bbd-8e8d-4a7d40bf80e3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.122;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-0.canonical.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 3/22/24 08:14, Marcin Juszkiewicz wrote:
> W dniu 22.03.2024 o 05:55, Alistair Francis pisze:
>> I see no mention of device trees in the spec, but I do see ACPI. Do we
>> really expect a server platform to use DTs?
> 
> This platform "kind of" follows sbsa-ref where we have very minimalistic 
> device tree sharing information qemu->firmware.
> 
> libfdt is small, format is known and describes hardware. Firmware is 
> free to make use of it in any way it wants.
> 
> On sbsa-ref we parse DT in TF-A (base firmware) and provide hardware 
> information to higher level (edk2) via SMC mechanism. Then EDK2 creates 
> ACPI tables and provide them to the Operating System.

We should ensure that only either an ACPI table or a device-tree 
description is passed to the OS and not both, e.g. when using

     qemu-system-riscv64 -kernel vmlinux -M sbsa-ref

But that requirement is not machine specific.

Best regards

Heinrich

> 
> In physical system some parts of information provided in DT would be 
> read by firmware from onboard Embedded Controller chip.
> 
>> These functions should be shared with the virt machine if we really do
>> want DTs, but I'm not convinced we do
> 


