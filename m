Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE0EC001DB
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 20:52:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTTgc-0002cf-TP; Tue, 08 Aug 2023 16:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1qTTga-0002cG-Gy
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 16:52:13 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1qTTgY-0002pB-Ah
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 16:52:11 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-686f94328a4so200333b3a.0
 for <qemu-riscv@nongnu.org>; Tue, 08 Aug 2023 13:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691527928; x=1692132728; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=bSKkwhdpLh/nnW86dzL18ZgpQUgswlv3SlQVDzBFYAM=;
 b=ykD3gQhzhX1pV3f1AQ0zTF1p8ZgsAJlyCvDBr0G4LI7sAj2gGNHb2IyRVJM6tn7ra2
 EIZN3bnaAY3LZJnH+GQLVpsJ81o/sKzc4DTDKtOU5RhaZEgeRVZslmONCJDYio2Pgdcd
 jbjbHsp1cb0joXenSaP1DMbulF+k/7LbNxpK1wLv+MJ5MUkhli3v06B2KLZKMw3B/rBf
 nZrjYxVciAw2uKLqfAth7pueiy+40iurEVlA+UrMU/aaxn2Ubu0WTpWLkNg/+BNtEGkq
 DPfjoR+xUkTWxyq+heY7o4wQ41Docj3+qGYojAsbM9uB3GrpMOqAXUQ4ynDhNNBNft53
 VhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691527928; x=1692132728;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bSKkwhdpLh/nnW86dzL18ZgpQUgswlv3SlQVDzBFYAM=;
 b=LfEW53D3DFeA0twOv4xpcUN7Pz+IbUODrYRp7jP1v0hXPhx/yoxZ+S8UYdPDCS7Kws
 Cn93gpYQaFQsJ+NJ1YvhIIMmNBtjhOyn8rPN2VfCxvY9vUVgSayj1hAO05KewQduo3jf
 rcJwSvLORHPIv9iy4eKY3iCYqFrHdZbGc8YrcKM55JBAEbRYgeyXESsOqeIIYeDoiPzX
 NxOFTwhweUJgCMt5SpHHQWsc1m31LgD36J42sbHxrB4wlNEg5OPWKqnhDS9+VCaHpYvx
 aW9qsudrTHLAWWqfPJ4OItdaKv/4Z6+urWd1cFsc/DmV98eceKCgFkeNhFqwxKCbTPH+
 5i1A==
X-Gm-Message-State: AOJu0YwwX9JwzBTGdvCI5Iq5B0wkz873G4mhGZUDp0OqlcWV0yWZSm8q
 QCAm+SHU0cQMHMX4aef3fy+GXQ==
X-Google-Smtp-Source: AGHT+IE2bx46EEVIgjd8fhbe7L2qJfjEal+FFtlpPuvTZmM9ytzOVqVrwQvOjtS/A+4lUaCqe8MiNA==
X-Received: by 2002:a05:6a20:3d82:b0:140:3775:308e with SMTP id
 s2-20020a056a203d8200b001403775308emr1175541pzi.0.1691527928548; 
 Tue, 08 Aug 2023 13:52:08 -0700 (PDT)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 l24-20020a62be18000000b006675c242548sm8448199pff.182.2023.08.08.13.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 13:52:08 -0700 (PDT)
Date: Tue, 08 Aug 2023 13:52:08 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Aug 2023 13:52:06 PDT (-0700)
Subject: Re: [PATCH 1/2] riscv: zicond: make non-experimental
In-Reply-To: <9fceb378-f079-e9ff-b8fe-da05b51fc1e1@rivosinc.com>
CC: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Kito Cheng <kito.cheng@gmail.com>, jeffreyalaw@gmail.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Vineet Gupta <vineetg@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-c8c16500-b5e6-4246-be18-849b74753d4d@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=palmer@rivosinc.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, 08 Aug 2023 11:45:49 PDT (-0700), Vineet Gupta wrote:
>
>
> On 8/8/23 11:29, Richard Henderson wrote:
>> On 8/8/23 11:17, Vineet Gupta wrote:
>>> zicond is now codegen supported in both llvm and gcc.
>>
>> It is still not in
>>
>> https://wiki.riscv.org/display/HOME/Recently+Ratified+Extensions
>
> Right, its been frozen since April though and with support trickling in
> rest of tooling it becomes harder to test.
> I don't know what exactly QEMU's policy is on this ?

IIUC we'd historically marked stuff as non-experimental when it's 
frozen, largely because ratification is such a nebulous process.  
There's obviously risk there, but there's risk to anything.  Last I can 
find is 260b594d8a ("RISC-V: Add Zawrs ISA extension support"), which 
specifically calls out Zawrs as frozen and IIUC adds support without the 
"x-" prefix.

I can't find anything written down about it, though...

