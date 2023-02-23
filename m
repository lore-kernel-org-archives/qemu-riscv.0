Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVKPL-0008JG-Ve
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 17:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pVKPJ-0008Gk-T4
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 17:49:45 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pVKPH-0007q7-Mh
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 17:49:45 -0500
Received: by mail-pl1-x631.google.com with SMTP id u14so10882343ple.7
 for <qemu-riscv@nongnu.org>; Thu, 23 Feb 2023 14:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=QQBU9k/QxVKceMOy3CGKDHpENVCP8QZpPc+ABlkMDzA=;
 b=5WBnfriRWHPDJuP6XgGT82ZZCVbos5E1GF7FtE00fuAuJ0xXNTh3mcEFxdF3UovWZ3
 lBEhzm8Ccjt0CNz/Wz8FuO8CABxyi8FzDgE6V+UtJ6w8w6BT0a9Mh4W5zD8g5Lu0X7fH
 2SELcACpma6F81bW9U6xrH2cq60D2l13DGkux6Fu23AIw9uL8UIuPQw0lpZHnGaM52dV
 iwbIMSXGCXpia/BXvymgPFd6+zXjCljHT3i9Pdj/o9S6ms2rG7lcPpedlyAv2S6u+4tW
 bQGDG+UG4ee1Mdr8S44n5I+qxJdd6wxhefhB7OdpzOehbqbdrHThtzIfHjacrcbuWcJO
 99yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQBU9k/QxVKceMOy3CGKDHpENVCP8QZpPc+ABlkMDzA=;
 b=F1l+Z+v3gUZ/TIE7DFoh3qor62Zfdmm0WoPiFOfGf3lMpRCwIlkMlRduUkFjH8VGnw
 XOASXiFeGMrkJiqZGqajdxzay1/yyMqH/gpfIwmMHZIKqGtep5f0DABmUZCYLXbzaK2a
 15kpifLPJj1X3IFR8LFyUTB94C5+Oukx7wfHOK+LSopBvLrUVDIqzCnQYtAG83RNwDSo
 z8lU+Sq88YDJOiVies5mwE9tpumDcKs9akwJTElM5y0l3KT5a1tJTVeZuNv6kGeU/iaW
 QKHL2zCv88DpXJiwoj9jeSF11DqZ8v9dIJfMc5el75a/hoxq/yqiRfjsF/Gye3SDqPXP
 e5kQ==
X-Gm-Message-State: AO0yUKU6KUO5Cvl5RWTRKcU9b53NlmQyAneBVUjpzCDHe6yX5gGyxf/q
 JLCJlwW4dSb2Bakye63XT5mIKolQU6UnzMLa
X-Google-Smtp-Source: AK7set+v3gtgI+BcGYy94Bgh3a4MCJVhxOibOgZ4GNRv+u85CuMnQkb2rYLAk+YLjKnRo9c6beIh9g==
X-Received: by 2002:a17:903:707:b0:19c:b7a9:d4a4 with SMTP id
 kk7-20020a170903070700b0019cb7a9d4a4mr4171947plb.37.1677192581308; 
 Thu, 23 Feb 2023 14:49:41 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 ja17-20020a170902efd100b00196025a34b9sm9153184plb.159.2023.02.23.14.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 14:49:40 -0800 (PST)
Date: Thu, 23 Feb 2023 14:49:40 -0800 (PST)
X-Google-Original-Date: Thu, 23 Feb 2023 14:48:55 PST (-0800)
Subject: Re: [PULL 0/9] Fourth RISC-V PR for QEMU 8.0
In-Reply-To: <mhng-3ef3787a-321d-4a23-aa45-8831b3093ac5@palmer-ri-x1c9a>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org,
 bmeng@tinylab.org
Message-ID: <mhng-61abd1f7-4d76-42de-85b2-42466ec0673f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 23 Feb 2023 22:49:46 -0000

On Wed, 22 Feb 2023 07:56:10 PST (-0800), Palmer Dabbelt wrote:
> On Tue, 21 Feb 2023 08:43:47 PST (-0800), Peter Maydell wrote:
>> On Fri, 17 Feb 2023 at 17:53, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>>
>>> The following changes since commit 417296c8d8588f782018d01a317f88957e9786d6:
>>>
>>>   tests/qtest/netdev-socket: Raise connection timeout to 60 seconds (2023-02-09 11:23:53 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>   https://github.com/palmer-dabbelt/qemu.git tags/pull-riscv-to-apply-20230217
>>>
>>> for you to fetch changes up to e8c0697d79ef05aa5aefb1121dfede59855556b4:
>>>
>>>   target/riscv: Fix vslide1up.vf and vslide1down.vf (2023-02-16 08:10:40 -0800)
>>>
>>> ----------------------------------------------------------------
>>> Fourth RISC-V PR for QEMU 8.0
>>>
>>> * A triplet of cleanups to the kernel/initrd loader that avoids
>>>   duplication between the various boards.
>>> * OpenSBI has been updated to version 1.2.
>>> * Weiwei Li, Daniel Henrique Barboza, and Liu Zhiwei have been added as
>>>   reviewers.  Thanks for the help!
>>> * A fix for PMP matching to avoid incorrectly appling the default
>>>   permissions on PMP permission violations.
>>> * A cleanup to avoid an unnecessary avoid env_archcpu() in
>>>   cpu_get_tb_cpu_state().
>>> * Fixes for the vector slide instructions to avoid truncating 64-bit
>>>   values (such as doubles) on 32-bit targets.
>>
>> This seems to have caused CI to decide it needs to rerun the
>> 'docker-opensbi' job, which doesn't work:
>> https://gitlab.com/qemu-project/qemu/-/jobs/3808319659
>>
>> I don't understand what exactly is going on here -- Alex,
>> Bin, any ideas?
>>
>> Why do we build the firmware in CI if we have checked in
>> binaries in pc-bios?
>>
>> Should .gitlab-ci.d/opensbi/Dockerfile really still be
>> starting with Ubuntu 18.04 ? That is already older than our
>> set of supported platforms, and falls out of support from
>> Ubuntu in a couple of months.
>
> I just sent along a patch
> <https://lore.kernel.org/r/20230222154938.9201-1-palmer@rivosinc.com/>.
> I have no idea how to test it in the CI, though...

Nobody's replied, so I'm inclined to just drop the OpenSBI bump and 
re-send the PR.  At least that way we can avoid getting blocked on the 
CI issues.  There's some more in flight so there'll probably be a 5th 
round before the freeze either way, at least this way the stuff that 
works can avoid getting blocked.

>> (.gitlab-ci.d/edk2/Dockerfile is also using 18.04.)
>
> I guess I'd missed this in the original email, I stumbled on that one as
> well
> <https://lore.kernel.org/r/20230222155341.10127-1-palmer@rivosinc.com/>.
>
>>
>> thanks
>> -- PMM

