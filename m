Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUrTg-00068e-OB
	for mharc-qemu-riscv@gnu.org; Wed, 22 Feb 2023 10:56:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pUrTb-00066Y-14
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 10:56:15 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pUrTZ-0008LO-71
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 10:56:14 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so1782908pjn.1
 for <qemu-riscv@nongnu.org>; Wed, 22 Feb 2023 07:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=xZncKXS3JLOWHAALUueHCR9aGhlXMQFbZdHD4bmhWSY=;
 b=V+YcUZDJgp4O/gqyBNv9+ieBxkl1omrOLZSKxteH05o0DVavlsqSMxDRSjs5FuTLEu
 P1bD/aLuN/axnqdNT/q5jIe6dUdUly+HmWeVM6j4i8tYvbF3hVDNOjgyGPMpfjgSHGVn
 Vfi/Biw5bCQ3BUSCkM2tjs6fOwoydY+aNILzYbNMrKu/3PNGWmWxIzG09Jz8hUE0UQy9
 qZJGJ8Ic/HvB0nGdvf3r8/7axKYz9GJrpGzdjPA0aym2rfFENEUFRtLinBkOyam2qz6S
 UJCMxdcxJzkRB7qoe3g5GkecKNi8hIElE8OYndTWV/CZ80MXoJszudz6VYrvdOcAVT50
 HLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xZncKXS3JLOWHAALUueHCR9aGhlXMQFbZdHD4bmhWSY=;
 b=N+1XaFKIB+mw5MD/fWdphswIgsvhFoLqtMjUuiLib5UVSRfZeHkneX96MrjHH41NNj
 uxb7KIwzcY/uAYmM0tE/4CWhKTStT5LCTe3NTQ7BG32EHapxMjtKVPmvSq3Jos3fw/d1
 WvH6CXkwQmLBZiRaxVGgwPc/vNdDVOiAZVo6Ad1E+SMz5SB8lWucGHUjVUVss8GCM9Gb
 570CTBEWeLV5l/0ggrW9O0T49TJlnswaYo4UZy9DfPiOTo8v2muQdtfdCyPVrkzDjNnB
 WEQ36y6pGF95a0NJiQA7rAExf6WovnM8+qTFPekLVyKDr/ssqqn1fZ32U42rG471f87L
 9bmw==
X-Gm-Message-State: AO0yUKW71RjS40XcOrsP08DcOLYmgjyISZtngJr3WXwAuUtosaK209xK
 Ko1yKDVjZdFTpSc9nDbDMynWtjR7E1/sZHmR
X-Google-Smtp-Source: AK7set8TnLBcQT0Ag3vracuLAw6hBpUU7mZu3WKgRrVEX9uLa0mkfH5FsEqcM/havnsH42CXemejSg==
X-Received: by 2002:a17:902:d501:b0:19a:96ea:3850 with SMTP id
 b1-20020a170902d50100b0019a96ea3850mr8808227plg.17.1677081371350; 
 Wed, 22 Feb 2023 07:56:11 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 ja17-20020a170902efd100b0019acd3151d0sm6702927plb.114.2023.02.22.07.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:56:10 -0800 (PST)
Date: Wed, 22 Feb 2023 07:56:10 -0800 (PST)
X-Google-Original-Date: Wed, 22 Feb 2023 07:55:11 PST (-0800)
Subject: Re: [PULL 0/9] Fourth RISC-V PR for QEMU 8.0
In-Reply-To: <CAFEAcA_DvrOgKAdVcF8OxpxUv9aPB5hOWjWryOt_SpFiNzY12A@mail.gmail.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alex.bennee@linaro.org,
 bmeng@tinylab.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-3ef3787a-321d-4a23-aa45-8831b3093ac5@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Wed, 22 Feb 2023 15:56:16 -0000

On Tue, 21 Feb 2023 08:43:47 PST (-0800), Peter Maydell wrote:
> On Fri, 17 Feb 2023 at 17:53, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> The following changes since commit 417296c8d8588f782018d01a317f88957e9786d6:
>>
>>   tests/qtest/netdev-socket: Raise connection timeout to 60 seconds (2023-02-09 11:23:53 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/palmer-dabbelt/qemu.git tags/pull-riscv-to-apply-20230217
>>
>> for you to fetch changes up to e8c0697d79ef05aa5aefb1121dfede59855556b4:
>>
>>   target/riscv: Fix vslide1up.vf and vslide1down.vf (2023-02-16 08:10:40 -0800)
>>
>> ----------------------------------------------------------------
>> Fourth RISC-V PR for QEMU 8.0
>>
>> * A triplet of cleanups to the kernel/initrd loader that avoids
>>   duplication between the various boards.
>> * OpenSBI has been updated to version 1.2.
>> * Weiwei Li, Daniel Henrique Barboza, and Liu Zhiwei have been added as
>>   reviewers.  Thanks for the help!
>> * A fix for PMP matching to avoid incorrectly appling the default
>>   permissions on PMP permission violations.
>> * A cleanup to avoid an unnecessary avoid env_archcpu() in
>>   cpu_get_tb_cpu_state().
>> * Fixes for the vector slide instructions to avoid truncating 64-bit
>>   values (such as doubles) on 32-bit targets.
>
> This seems to have caused CI to decide it needs to rerun the
> 'docker-opensbi' job, which doesn't work:
> https://gitlab.com/qemu-project/qemu/-/jobs/3808319659
>
> I don't understand what exactly is going on here -- Alex,
> Bin, any ideas?
>
> Why do we build the firmware in CI if we have checked in
> binaries in pc-bios?
>
> Should .gitlab-ci.d/opensbi/Dockerfile really still be
> starting with Ubuntu 18.04 ? That is already older than our
> set of supported platforms, and falls out of support from
> Ubuntu in a couple of months.

I just sent along a patch 
<https://lore.kernel.org/r/20230222154938.9201-1-palmer@rivosinc.com/>.  
I have no idea how to test it in the CI, though...

> (.gitlab-ci.d/edk2/Dockerfile is also using 18.04.)

I guess I'd missed this in the original email, I stumbled on that one as 
well 
<https://lore.kernel.org/r/20230222155341.10127-1-palmer@rivosinc.com/>.

>
> thanks
> -- PMM

