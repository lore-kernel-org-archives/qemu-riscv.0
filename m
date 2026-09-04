Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F43AC79F82
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 15:44:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2W59-0000kL-RD; Fri, 04 Sep 2026 11:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x2W58-0000jv-6F
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 11:43:58 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x2W56-0002ho-9g
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 11:43:57 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-482e257a23aso820805f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 08:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788536634; x=1789141434; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ea9l8vCw3+MyUHczI6di830buXi9mqJ03YPN+mVWElU=;
 b=GodTKf0V02Qy4oulJU4W7yY0mSCPeg/WEoHWI/+wdYfz5umoCnmYhztjF0QfsvYTsX
 ZLuN65+UMpcmLICvFnAPWCRBy/mu0uCNZmvSyfCJEQ8jKFK3wr2qvlOg+ZCKrECvpdAh
 uwZJsPIyVhS4BTaBV4kv0ogGuH0uCLww4lPqEjoIh+bEXH+IjjsG3VGQFUBJz4r6hRmb
 0J9IHoAovtfXKVGNP6asknb1uyFEPT6Hu5wAqD6Wcs6sziAdg/VjXn1pYNih9WaMSwFI
 d6MtqEfFLbTZ6eI1YjTZLBEEEFB4cjXgOnZkEB5DfOkd3vfFZwLzDtBoP2ZCM3JaHRj8
 1lJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788536634; x=1789141434;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ea9l8vCw3+MyUHczI6di830buXi9mqJ03YPN+mVWElU=;
 b=P1ZNNYO+i0VwrmSh9eJo+hZy1KTyybYChWBC20vQ0uB70hhsev3P4L24KCsQdYIOTe
 tx+AiNxRrQqGdLTL8ZzXHdIXQ8xZm4RGp0cmHwzoz9j9lzntaZykgtK7DXVsgQ+79OVY
 pgm5j6ERkUXmdmjXl9HCHWULSC0ahF8/NQliHWyYEtvkG8C9AaJE8ZAxtHUe4wt/If0o
 yjcvYj3x/rkMDgnNrUEdrQmqNjWYaavSsF8xxbK27U6j5mZ9laAjwfT5Ryy8rk16u2p/
 MO752lOeL1p/D3Y228xtVVuwOlDSWSwBhzSeVJtKKGJvYaWLmqHnXvqohQhqOhj6rfKo
 JtqQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByszMf76POQbj0HaOAHuBhx6Eok40L96MEGvd6cMbzUYzp1sYxKu3BeZwX0h3OSgE66JyBHVfY9eTMy@nongnu.org
X-Gm-Message-State: AFuF++n7ctegPOXgnadoTud5tlNgp1qDJKueG3gNM1NSzs6qo683MFZw
 SlhhrkqiQL2LG5ubgAT6mNKmgihCSpVLw5ue6N14ageGjshrtmlqbnAyt7GyKO570+Y=
X-Gm-Gg: AYBFou2DnEAPXnmtmBLb/iBXS5q3dPuhzUZYncyjDd4TU6wwS26OZtBucozXOZSAp1Q
 3q+g+2pJZzhEHPyk8lNoNWpH/iwF99iIHyACKzy5xNlsVaGSMMHrl1EBrcFrH94muov4z7rLNre
 oOY98Nq+1AXFdbP9YwQ//0hOrUEhGwZzsx355Iv1d1iJW0lJ5LCcyqtpJGekSV8stmEOUDvnASb
 FRRwge9ZWJqgtFAelQyT/BQ2hJCSZAA1Xm8eZokrmIDG4WewU94/aXdxOPBpo9p1RD7nRL0VSGQ
 08KsJp+n658tzloKiEpJ6+fKt48X2HNPyrkQYSNqHroJ+gw0rKPUR3YNet5uJFJ6ePtJib/JTKN
 lHKrFCYg5JxPFb+5OE8YVLLBAniEtUELGhJKA4iQ1e3zs+TEcZn5dixs7urGCkTY9bAJxpRIivZ
 YlgtNoOnb7R5Jzq9727J3vyHK5HCE3K513E3PYXj1tCEZy8G7vUcfI1fsJTj5s
X-Received: by 2002:a05:600c:8b32:b0:49b:d03:8d3a with SMTP id
 5b1f17b1804b1-49cf8244878mr72180385e9.11.1788536634421; 
 Fri, 04 Sep 2026 08:43:54 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7703cefsm105587085e9.5.2026.09.04.08.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 08:43:53 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 007B35F954;
 Fri, 04 Sep 2026 16:43:51 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 qemu-riscv <qemu-riscv@nongnu.org>
Subject: Re: [PULL 000/105] move check-tcg into the meson build
In-Reply-To: <18f4fdf4-1e8a-449f-a003-3bff20499a29@oss.qualcomm.com>
 ("Philippe =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 4 Sep 2026
 15:46:43 +0200")
References: <20260904124604.2207440-1-alex.bennee@linaro.org>
 <18f4fdf4-1e8a-449f-a003-3bff20499a29@oss.qualcomm.com>
User-Agent: mu4e 1.14.4-pre1; emacs 30.1
Date: Fri, 04 Sep 2026 16:43:51 +0100
Message-ID: <87h5k5owco.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com> writes:

> On 4/9/26 14:44, Alex Benn=C3=83=C2=A9e wrote:
>> The following changes since commit 99e54ab5e7a6efc945af6d5661842155d1f3f=
c7a:
>>    Merge tag 'hw-misc-20260903' of https://github.com/philmd/qemu
>> into staging (2026-09-03 16:43:24 +0100)
>> are available in the Git repository at:
>>    https://gitlab.com/stsquad/qemu.git
>> tags/pull-11.1-check-tcg-meson-040926-1
>> for you to fetch changes up to
>> 26395b536c3ec0a857dffd6548d8ef49479dedad:
>>    MAINTAINERS: add maintainer for tcg/tests meson infrastructure
>> (2026-09-04 11:38:01 +0100)
>> ----------------------------------------------------------------
>> tests/tcg: conversion to meson
>>    - remove unused variable from multiarch/memory
>>    - standardise checking plugin output
>>    - bump minimal meson to 1.6.0
>>    - introduce meson plumbing for check-tcg
>>    - return error code if docker probe fails
>>    - add CI/self/mem test to gdbstub prot-none tests
>>    - use raw opcode for fprcvt test in arm
>>    - remove unused variables from gpc-test
>>    - teach probe-gdb-support about mips
>>    - identify or1k pc register
>>    - port check-tcg logic to meson (all targets)
>>    - update documentation
>>    - add Pierrick as a maintainer for tests/tcg
>> ----------------------------------------------------------------
>> Pierrick Bouvier (105):
>
>>        tests/tcg/riscv64: add float reference files
>>        tests/tcg/riscv64: user tests
>>        tests/tcg/riscv64: system tests
>
> Some of these likely need to be updated for the latest RISCV merge:
>
> $ git diff --stat 99e54ab5e7a..d2843fbf802 tests/ | fgrep Makefile
>  tests/tcg/riscv64/Makefile.softmmu-target |  14 ++++
>
> $ git log --oneline 99e54ab5e7a..d2843fbf802
> tests/tcg/riscv64/Makefile.softmmu-target
> 883a4d4da4d target/riscv: preserve vl on element-zero fault
> bbdccc84fc3 tests/tcg/riscv64: Add tests for rv128 [ms]status
>
> (not sure if this can be done on top although)

Merged inline, see v2:

  Message-ID: <20260904150826.2331577-1-alex.bennee@linaro.org>
  Date: Fri,  4 Sep 2026 16:08:26 +0100
  Subject: [PULL v2 000/105] move check-tcg into the meson build
  From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

