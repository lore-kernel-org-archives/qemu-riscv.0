Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iQynq-0007ou-R6
	for mharc-qemu-riscv@gnu.org; Sat, 02 Nov 2019 15:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59132)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iQyno-0007nq-5e
 for qemu-riscv@nongnu.org; Sat, 02 Nov 2019 15:11:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iQynm-0000IB-MS
 for qemu-riscv@nongnu.org; Sat, 02 Nov 2019 15:11:11 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42286)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iQynm-0000HM-HP
 for qemu-riscv@nongnu.org; Sat, 02 Nov 2019 15:11:10 -0400
Received: by mail-ot1-x342.google.com with SMTP id b16so11172841otk.9
 for <qemu-riscv@nongnu.org>; Sat, 02 Nov 2019 12:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zPimsA8Gh9fQGgAO71ocUQL0iIVEb/d5agS+cm9E5Ig=;
 b=eM8JsF6+6rym0qK7vIPrJjQojYn4jdpqGvhGUPA8TGxuyLjFeBLIog66Dthj6K4YVe
 OLMkbvgDIhhSFJVShsNYIAhfs05EW2Bm2PhJtXsTv2/WYHspI30cuY2SqkyncL5yzuNz
 nS0zNjc2iktODNpcfeSGmyVn93Ii5nkTXE7xhtQPkXS/rEG9zTN5OthQbuwmVj7s3KTF
 yFAHkr9qh9gPah7Wh7vnTUU0GxIU30mOCmb822ihKuV7RphAdQbmSUi+1tvp1Y3GEIrQ
 c2tXcnq4VduEebTBovP5SwTSmLwfgGUgLwZc1vk9uUBpJP3s6Euqbw0yp6d9TowH8irQ
 g7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zPimsA8Gh9fQGgAO71ocUQL0iIVEb/d5agS+cm9E5Ig=;
 b=HD45t12T6sgWy8hc+QH8AiGhEaRfOWhbMW3DXzZeqj8UDIjW8fGyreI5IodR9j6ckJ
 3gf3zhqV9S3SLah2kqGEeTrrYxE4PVsouBpVSD4ON7fmLOkfnnWqiqBjcFwh63BAEscp
 30H+cP4h8Xele/9Fy7QRvtjucyFWtQYg3ohTbOL+RI9r8Qv29AHcNkCDTdx2zHgtQePM
 uV9BSdY1bTG+lRFo5P13U3kdjjZTvp6T07wvds6YeSOpV1d5yGlpxFRIxtoMsJxKfkMg
 cZX6j2xbb3TG0sMVJ//+TMT/AZfQM+x5YDgEcuBb1NJy69B5lKTpEXMnEesFuWqV32YG
 C9pQ==
X-Gm-Message-State: APjAAAXiGVQ5+ZYuazA/q4q8qdrSo2xnPayzrUJbBbx2eDZuYh0MPJto
 YqHD88hrpVsC/YA+zvSymzjwMf82oRs9zOyaSvXRkA==
X-Google-Smtp-Source: APXvYqzREGGHeYJrOgoM5qlZrvt6Dv514oAFYm6HlGkgQn/1b8ew3zQgsaxHCk7Y01NiX55cCrzuFwyZxRNoX4XmUdU=
X-Received: by 2002:a05:6830:c3:: with SMTP id
 x3mr10354275oto.91.1572721869296; 
 Sat, 02 Nov 2019 12:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191101161654.2871-1-palmer@sifive.com>
In-Reply-To: <20191101161654.2871-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Nov 2019 19:10:57 +0000
Message-ID: <CAFEAcA9hPWTguDeM=BxbgVBq5yFpRfToMUJV86Rp0siCJUCOSQ@mail.gmail.com>
Subject: Re: [PULL] Update my MAINTAINERS file entry
To: Palmer Dabbelt <palmer@sifive.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-List-Received-Date: Sat, 02 Nov 2019 19:11:13 -0000

On Fri, 1 Nov 2019 at 16:17, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit b7c9a7f353c0e260519bf735ff0d4aa01e72784b:
>
>   Merge remote-tracking branch 'remotes/jnsnow/tags/ide-pull-request' into staging (2019-10-31 15:57:30 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/palmer-for-master-4.2-sf1
>
> for you to fetch changes up to c1677bcc395eb977cc7279a1af0a1d23ad23fdd4:
>
>   MAINTAINERS: Change to my personal email address (2019-11-01 09:13:30 -0700)
>
> ----------------------------------------------------------------
> Update my MAINTAINERS file entry
>
> This contains a single patch to change my email address.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

