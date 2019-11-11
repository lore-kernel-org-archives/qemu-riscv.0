Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iUBeg-00009c-Ig
	for mharc-qemu-riscv@gnu.org; Mon, 11 Nov 2019 10:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34786)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iUBee-00007O-71
 for qemu-riscv@nongnu.org; Mon, 11 Nov 2019 10:31:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iUBed-0002x1-8n
 for qemu-riscv@nongnu.org; Mon, 11 Nov 2019 10:31:00 -0500
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:38440)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iUBea-0002vE-Tv; Mon, 11 Nov 2019 10:30:57 -0500
Received: by mail-yb1-xb43.google.com with SMTP id k206so2500955ybb.5;
 Mon, 11 Nov 2019 07:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nNX87jqf7w0yVC+SWgvceNRMH4E2BIFEdTKvtHwkW88=;
 b=HRTakYy7Q63CyRGUZ9nITftVbai57xCwUA4/OxZcep6z1FWq8smJV4G6OkupcBlsnt
 nqm0Ea30usX138sLfQvAU4NREMa+KnJzCnR9tZNtcpQh2Cm4sjy2U8TUIMD9zDjLmHaM
 9bsObPZgBNguCVemqFqah37gbrPWwqmcrp8AsuUJHz6wurvSEPSfVbkHP9EjHCdu2zUn
 vAO19ft6HqJocY+uLednhwYfbyPzcOMHoSI+7zhBqZ4a7iluNImCRToLQ6WUuRNqnSrj
 6mnPdocwXfrSS9nZ+QgK/uuDH7CPSfTWKGr+kCi1Ytw+cYBLLeOtU/8hywLvhDMu6Xqf
 /hrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nNX87jqf7w0yVC+SWgvceNRMH4E2BIFEdTKvtHwkW88=;
 b=VYVHVS9qzoAG5k0wG2+rf9pIE81DvNQxxozGTYcu6rMuaI1uemx6YW2+GjTc9A3I5b
 ecyJS/vQM4mrk+dR/HLmskzWSMmtz9J4S8aQEZznd/rY58sw108lcJVDNhSItCHdNsQL
 56fMhtXqpESXGcfEYFvXheyv459MG8MoulAIx+6iHTOAaqTXWfLJ0GcqzQeaOkcGYgeM
 f72BKNE9lQ7R/u88uzKQkIi7URA6m4YVmeeKaha/tJVwCoktKvhV+WP2LZq6BkwQ3DSH
 acUgewWN+gp90xbDGGwCYG+h7yJGBaVzJXVxiqRiDeQX4pUv6m6lGLnPUAXnBxH0Njou
 I97g==
X-Gm-Message-State: APjAAAUS9bc5D9BG1TKgMxGVdAeqUwKbIwO3yYlq617QdF/bT/hC56Gg
 1+kQHrN2UyXi7SVyrIHn54BkAPaB1OAnroWMb3Q=
X-Google-Smtp-Source: APXvYqzq2lCHJ5rDH1EDw7SEToEdbx1HFK3JpYPm+55NnT6E6tkaUUgaMOQHAvCtFL0jR+0zVv/D2VJDpeA9wdvurhM=
X-Received: by 2002:a25:4144:: with SMTP id o65mr21208253yba.11.1573486256031; 
 Mon, 11 Nov 2019 07:30:56 -0800 (PST)
MIME-Version: 1.0
References: <03c2f42b32fb4e304319c241122ae83584f085e0.1573087610.git.alistair.francis@wdc.com>
In-Reply-To: <03c2f42b32fb4e304319c241122ae83584f085e0.1573087610.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 11 Nov 2019 23:30:43 +0800
Message-ID: <CAEUhbmWaT06GAdz=d-oVtMsM6bOWR23bZjicgBsJLUHqaVRH7g@mail.gmail.com>
Subject: Re: [PATCH for 4.2 v1 1/1] riscv/virt: Increase flash size
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b43
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
X-List-Received-Date: Mon, 11 Nov 2019 15:31:01 -0000

On Thu, Nov 7, 2019 at 8:54 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Coreboot developers have requested that they have at least 32MB of flash
> to load binaries. We currently have 32MB of flash, but it is split in
> two to allow loading two flash binaries. Let's increase the flash size
> from 32MB to 64MB to ensure we have a single region that is 32MB.
>
> No QEMU release has include flash in the RISC-V virt machine, so this
> isn't a breaking change.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

