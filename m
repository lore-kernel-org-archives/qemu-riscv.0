Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jEBni-0001zu-Aj
	for mharc-qemu-riscv@gnu.org; Tue, 17 Mar 2020 08:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60489)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jEBnf-0001wu-I1
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 08:58:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jEBne-0003NE-2N
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 08:58:27 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:41613)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jEBnd-0003Ep-Rv
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 08:58:25 -0400
Received: by mail-oi1-x242.google.com with SMTP id b17so6624363oic.8
 for <qemu-riscv@nongnu.org>; Tue, 17 Mar 2020 05:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vEyOiHsdkpDwrVPBg4od8ujETT3HpbjzMWimG7ThbVk=;
 b=FXOju6qy3oD64HclHSnvNXQR6qUBDey+YH6dLE2VkNCVekC8byyx3NxWI7phQ60jRl
 u7lFrbc60hBFLhFjhvLW6uUVXVioegKd+wgA09WjocZa+y1kNAfmv4xUhrMytD0l2L93
 tyWdGCZuTWlvjUdFqMftixn5teiq07GqQitAhzUDNoAdaVWtxTBsNGuaKsFzzavgQQx0
 2eCHDxqgJ8KLbnpB+YK4MKffLo5Q8f2o2f1dac0723I/0WlPpRQPU4/X2SDSh/VthrE1
 TRL5/NLLiy98JX9WP9J5JnBl7ZCDPLt+7QjoDD/c0zhqwwKbcSkICBKiQnOZNIG/kk+F
 eKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vEyOiHsdkpDwrVPBg4od8ujETT3HpbjzMWimG7ThbVk=;
 b=gfg2OHjxPhd+G54eGbMms/zTOk2yYEZnVgSRR1BFII/41HHITF5dIEXOPhzhkUni3y
 spED0MJsUGCPe6Hm0PskKdHmHX/P3TL4j1VNcWJEe/qULRk5Kr8bJxwhieNaYjgpgiE3
 Y9YhxpD/1MPtV826lI9GUdGWqAICmJ3M5Z+X28z8CXWFlCVqHuqfKedgThTeLc7VTEzo
 IZ5ZmS3JvHmudMTT/cnXy7/lG1kl5WUTdZwV0Nm9dRXVD4LiMvH4bk/PfFzBa1rpTDSu
 Z/r06sdJ7jGTV7HFqhF9iDOb/rcs/2wAEYxjBeDp+3xMJ++JhbleTrsH9ElLfGOvcKUs
 IWSg==
X-Gm-Message-State: ANhLgQ3sA5PgNTtzREYlPi5LHj0LAt371p68BmpNcL4jK8xGilZAnDe5
 hkuoHrsJsCPAYRSlrQ5qN3WptDPidDLl4kl64LeNlA==
X-Google-Smtp-Source: ADFU+vuiwazAjoxQ7YHwGhvnyjgLXrD8+Zl7gAbcwlbqqC9jnX1qXW9hUwn7VwApLlSImh7LvsBX9zQxIM1ssH+Nzog=
X-Received: by 2002:aca:5b07:: with SMTP id p7mr3219694oib.146.1584449904852; 
 Tue, 17 Mar 2020 05:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200317040547.222501-1-palmerdabbelt@google.com>
In-Reply-To: <20200317040547.222501-1-palmerdabbelt@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Mar 2020 12:58:13 +0000
Message-ID: <CAFEAcA-Gm8U44LiS3rUxMi-qcnRJWgtisdEfJRPC4stkrbnOpg@mail.gmail.com>
Subject: Re: [PULL] RISC-V Patches for the 5.0 Soft Freeze, Part 5
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Mar 2020 12:58:28 -0000

On Tue, 17 Mar 2020 at 04:06, Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> The following changes since commit a98135f727595382e200d04c2996e868b7925a01:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/vga-20200316-pull-request' into staging (2020-03-16 14:55:59 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:palmer-dabbelt/qemu.git tags/riscv-for-master-5.0-sf5
>
> for you to fetch changes up to c5969a3a3c2cb9ea02ffb7e86acb059d3cf8c264:
>
>   target/riscv: Fix VS mode interrupts forwarding. (2020-03-16 17:03:51 -0700)
>
> ----------------------------------------------------------------
> RISC-V Patches for the 5.0 Soft Freeze, Part 5
>
> This tag contains the last of the patches I'd like to target for the 5.0 soft
> freeze.  At this point we're mostly collecting fixes, but there are a few new
> features.  The changes include:
>
> * An OpenSBI update, including the various bits necessary to put CI together
>   and an image for the 32-bit sifive_u board.
> * A fix that disallows TSR when outside of machine mode.
> * A fix for VS-mode interrupt forwarding.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

