Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F18EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 21:39:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJhYg-0006Sj-0G; Wed, 12 Jul 2023 17:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJhYe-0006Sa-F5
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 17:39:36 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJhYc-00080f-Q4
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 17:39:36 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1b0748bc78dso806307fac.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Jul 2023 14:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689197973; x=1691789973;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B1CpNU1yxvoPMpTIAVWBsDAeufSSXdXHs+ig3WfweDM=;
 b=bw+vm2Nk461KEcfcvTHt560zMBWgFr56U/kzuU6+FhLcI9JipqSHfMRz4EAfB61+1D
 psptKKs/ZEDjkvqWJUcWIvyn1Gg6JKytmlXy9I4XvAp5onLANapQL3qoQozVL8e8uVS0
 RXHfKO/8i6e1CJ2e1kUsRnL4h0POcm8J0qlNwPUHKpmXZLTP1ul/4OJfphkbYtDBFNPN
 5faAR8H+fOUjZBnD6vyk3M64AdCxT5T05GuTe+N7qSatEOcC9Vy5Re6zzegN2/glbiiE
 VMRmun2s5eIbBDJZFeyoY+v79OdzcKFz0BSqRzbjBodVqxsmGeini0TIry1hmdk/VJQE
 NHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689197973; x=1691789973;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B1CpNU1yxvoPMpTIAVWBsDAeufSSXdXHs+ig3WfweDM=;
 b=YL/d0clXOcFKwXbXARwKIsjkngBEcePKdoFaHSM1qT3md/AA0Tfr9CHJn2HkEmjD++
 0LcurffCKgPXKj1XoT24ICTbX+UgOCe2TX9VA26A3eqCTX+9Cahvk2aRiHJbqsToVIRe
 XwF2TujZAqZhD7L1/VqXNkas78MHqjyoxeCpZihJFYnGYFTASabF907iM99BkdhJb977
 GwQL46b/XjlrxA3LOrmfzFpI87PSsvq/TuSeZhhXntWhvNFzz6xM5YAID+v9PfAQfF1z
 WgAbxUCOIUq7kW2Bg6yOVOwmdqVtAKzZfx+vUXvV/rnoc5bDcSUss0GgiO9kHOKzxoRs
 xYyQ==
X-Gm-Message-State: ABy/qLYqmUD2n1jpU9FtpWscIeqxGoxrxiWjI39k2ekspMbYqcxG4FTP
 mNCkyPld/OyBhBD+TSsgFmkcpA==
X-Google-Smtp-Source: APBJJlFZhqK4nEbenIcvvH1OpoKpYV6mdbsYQG4hB4DKMC9YSYmE+GY2pzAjie/sxeJXp6Fi6nRrMQ==
X-Received: by 2002:a05:6870:42cb:b0:1a9:f6ba:138a with SMTP id
 z11-20020a05687042cb00b001a9f6ba138amr62764oah.0.1689197973028; 
 Wed, 12 Jul 2023 14:39:33 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-19.dial-up.telesp.net.br.
 [201.69.66.19]) by smtp.gmail.com with ESMTPSA id
 zh27-20020a0568716b9b00b001a663e49523sm2407074oab.36.2023.07.12.14.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 14:39:32 -0700 (PDT)
Message-ID: <5dd3366d-13ba-c7fb-554f-549d97e7d4f9@ventanamicro.com>
Date: Wed, 12 Jul 2023 18:39:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH for-8.2 6/7] target/riscv: add 'max' CPU type
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230712190149.424675-1-dbarboza@ventanamicro.com>
 <20230712190149.424675-7-dbarboza@ventanamicro.com>
 <20230712-stench-happiness-40c2ea831257@spud>
 <3e9b5be8-d3ca-3a17-bef9-4a6a5bdc0ad0@ventanamicro.com>
 <20230712-tulip-replica-0322e71c3e81@spud>
 <744cbde6-7ce5-c327-3c5a-3858e994cc39@ventanamicro.com>
 <20230712-superhero-rabid-578605f52927@spud>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230712-superhero-rabid-578605f52927@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.11,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 7/12/23 18:35, Conor Dooley wrote:
> On Wed, Jul 12, 2023 at 06:09:10PM -0300, Daniel Henrique Barboza wrote:
> 
>> It is intentional. Those default marchid/mimpid vals were derived from the current
>> QEMU version ID/build and didn't mean much.
>>
>> It is still possible to set them via "-cpu rv64,marchid=N,mimpid=N" if needed when
>> using the generic (rv64,rv32) CPUs. Vendor CPUs can't have their machine IDs changed
>> via command line.
> 
> Sounds good, thanks. I did just now go and check icicle to see what it
> would report & it does not boot. I'll go bisect...

BTW how are you booting the icicle board nowadays? I remember you mentioning about
some changes in the FDT being required to boot and whatnot.

If it's not too hard I'll add it in my test scripts to keep it under check. Perhaps
we can even add it to QEMU testsuite.


Daniel

