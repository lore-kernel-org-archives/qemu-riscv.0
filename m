Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9tc1-0000eS-KM
	for mharc-qemu-riscv@gnu.org; Thu, 05 Mar 2020 11:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33339)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9tby-0000Y4-Dp
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 11:44:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9tbx-0007eg-Bz
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 11:44:38 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:45184)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9tbw-0007bx-7L
 for qemu-riscv@nongnu.org; Thu, 05 Mar 2020 11:44:37 -0500
Received: by mail-ot1-x334.google.com with SMTP id f21so6307375otp.12
 for <qemu-riscv@nongnu.org>; Thu, 05 Mar 2020 08:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8RQgxAytKvFsrqMKrCpxhTLSrB87xnJaR0cBqI+uAPM=;
 b=MlMq69bwI+qfCkLQfhaohorZEArrafzZGqJWVgEMKU3B7tbswQj6zZbpX7DV9qYjnn
 M3NORKzLyQi5YpVMgrKX8ytnekVWx8AtBQmL5g89KSVJJXJOUH9oSRBgTSAqd7MYiUOU
 IXqdQTaIz5x6lYiN68QKUXXSf4fHtJMeZG1sn5YAtmmqtXIzcM+kbaYoZOBVbu1/J1uo
 WCP155qg/DJbI6Bh78CGXuGnv2dIUHFgOGOy9GMUKxvtN3bCQ7Y4+47nU5Ii+qUuGs87
 6o3Wi+cQ2JgMUjQAepu3uPEbgHFrSuNC2/K4OR3O6JBQco///Ah/52yMDBblLwXvk8sK
 A/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8RQgxAytKvFsrqMKrCpxhTLSrB87xnJaR0cBqI+uAPM=;
 b=K19iOlPkdIzOA/ri18B9ZpuKjlNWOg9HIRZ5aOcPkbTnjRIq7ucPHAwJlXC4H7TxHl
 pMwV3vTM8N6ujhxoqj6I91EWAkkMY6nhhxW/l5yR71Bxr8fvJrUu0GiZkot5lyJr14qY
 Emk5uJESeZKjWV+/A6rJBuAikDyXsb2aIGbwIYTR+1a3LIwE6ztK0jhpGZLDTEBQCxPe
 8OPs9IVdYg3sV/PdsLbpWrwjMzDAjQjizZdUsAIf+VNVu0HwSGy6jQGzjlVqfINC/dYE
 9eVKA82KWw7xomqfCJAYBymxtHhRpP4JDC6CoEp28J7HUEIQt6rzjBNosCW/6Frp0H8G
 GsHA==
X-Gm-Message-State: ANhLgQ2yW2pyxWxmkLWIfetaFh3Zre3FnwCZkldOYbiY7V+el2M9DtQu
 FRp8fGKdhP++lsEcy3jm8j8KOC/gp3c7nsvlnylSLA==
X-Google-Smtp-Source: ADFU+vu6RVLX6O6uZ79AIUc2TsahspZghA3XNueFG+MI1/6mmVBtYpGGZke9sjgEbni6iel6vgj5zR+6Xk1blMnqe/Q=
X-Received: by 2002:a05:6830:30ac:: with SMTP id
 g12mr6057165ots.221.1583426675327; 
 Thu, 05 Mar 2020 08:44:35 -0800 (PST)
MIME-Version: 1.0
References: <20200303004848.136788-1-palmerdabbelt@google.com>
 <20200303004848.136788-5-palmerdabbelt@google.com>
In-Reply-To: <20200303004848.136788-5-palmerdabbelt@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Mar 2020 16:44:20 +0000
Message-ID: <CAFEAcA9gHNXfGutEZiW-PYJbhdUZEd-dPDp8iwO-Ni_cSD9gZw@mail.gmail.com>
Subject: Re: [PULL 04/38] target/riscv: Add support for the new execption
 numbers
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::334
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
X-List-Received-Date: Thu, 05 Mar 2020 16:44:39 -0000

On Tue, 3 Mar 2020 at 00:49, Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The v0.5 Hypervisor spec add new execption numbers, let's add support
> for those.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  target/riscv/cpu.c        |  8 ++++++++
>  target/riscv/cpu_bits.h   | 35 +++++++++++++++++++----------------
>  target/riscv/cpu_helper.c |  7 +++++--
>  target/riscv/csr.c        |  7 +++++--
>  4 files changed, 37 insertions(+), 20 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index efbd676edb..2f62f5ea19 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -67,6 +67,14 @@ const char * const riscv_excp_names[] = {
>      "load_page_fault",
>      "reserved",
>      "store_page_fault"
> +    "reserved",

Hi; Coverity (CID 1420223) notice that there's no comma
after "store_page_fault", which means that there's been
a concatenation of that string and the following "reserved".
Could one of you send a patch which adds the missing comma?

> +    "reserved",
> +    "reserved",
> +    "reserved",
> +    "guest_exec_page_fault",
> +    "guest_load_page_fault",
> +    "reserved",
> +    "guest_store_page_fault"

You might also like to add a trailing comma here to avoid
the bug happening again in future.

>  };
>

thanks
-- PMM

