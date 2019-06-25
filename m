Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hfhd0-0002oI-QR
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jun 2019 05:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40978)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hfhcy-0002iQ-B6
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 05:20:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hfhcx-0000f6-CT
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 05:20:36 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:39724)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hfhcv-0000dI-9b; Tue, 25 Jun 2019 05:20:33 -0400
Received: by mail-ed1-x541.google.com with SMTP id m10so26121421edv.6;
 Tue, 25 Jun 2019 02:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6CAUriDiInsread6UoM/OGkAuokI2nSp6VMr0JV2rSI=;
 b=qpEjhFEbjAkkWbT40kOMjbgQH2uQFdQyhe5mE7WfMcw7bt773RnhuhIV0Iil+3CbP0
 3It+6udDENAblccaGb5xuRC5nVEfNQbCV47UCl85pW/88kE5t34yXrIXB2yNlss5sT8q
 4wJ9o0h+1aZ+kSf6AInzceL0oNxJCUoNbqreD+5wS9EON52+f7nS2katKF8N5BnaexKb
 8eUS7e9k8rgIK8aXCyYQmI9nv/FuugUWhaCmuk/HWdEbwPC7EmJvF434iJX7in+7k3mU
 tOrdasdB5abNdeF1K/LvOmysWSa/Ba0Hb7qU9TALmQErgvYEsrh3aFg2uHKYQFGGD/jW
 w4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6CAUriDiInsread6UoM/OGkAuokI2nSp6VMr0JV2rSI=;
 b=l2gMWdVguBPbnVv3XI12kPkzz/Y/uFQ6STz0kNUB+aWLLzoFEFJeJQ4SLJpMIWV8ZS
 2PsjNJ8RQEiz7npHbmoSkyDH1cTJcyvcxpbA8w+MHK+YHZnsbdjNj47lnvndwRv0DQh0
 otCsz8SQf6LH2Eg0lZNtZnvp0iEa3OlNbwrHjBTFchuHjxfdxLpCyPmtS1Ls3VCvPA1i
 IjjxWqPTlgoDvZnJO4TkK3evNpm2O4iAJFUvz7Hr2ZsDq1h+yj8TlZKQcivWPR8XaiSb
 UNwYv7NuEO7WQ5IAsbNa1m5TPWHZLqSFc2VDubqZ8ZNxrtFjcLewZXUeW5OQhHS1zhMO
 w8wg==
X-Gm-Message-State: APjAAAX0uFCziStgLIpjkxViXLfDkmTuLNO6evvIebczWOWmZXmoSB47
 MuRBHavyq9FumviQPqT7NgjI8ZbXoxPuoztSpMpw0Q==
X-Google-Smtp-Source: APXvYqx1zsPArE/K/iWGCs9RKxJdwRYP4H6VrNeY0pybIJCb6e0aMqZmEWa8N0bQVSzp9D+SxN8ySOFbQw4rHw5EuY0=
X-Received: by 2002:a50:94e6:: with SMTP id
 t35mr131194682eda.137.1561454432513; 
 Tue, 25 Jun 2019 02:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561414240.git.alistair.francis@wdc.com>
 <c010cba5f307352f3f2b699231286d54d0e029df.1561414240.git.alistair.francis@wdc.com>
In-Reply-To: <c010cba5f307352f3f2b699231286d54d0e029df.1561414240.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 25 Jun 2019 17:20:20 +0800
Message-ID: <CAEUhbmU1xB_5Bpkvu3xWXBj7n0DtxvZ7CbCH2LB1NpeRnW=gnA@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 4/5] roms: Add OpenSBI
 version 0.3
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
X-List-Received-Date: Tue, 25 Jun 2019 09:20:37 -0000

On Tue, Jun 25, 2019 at 6:19 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Add OpenSBI version 0.3 as a git submodule and as a prebult binary.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .gitmodules                                  |   3 ++
>  Makefile                                     |   5 +-
>  pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin 0 -> 28848 bytes
>  pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin 0 -> 28904 bytes
>  pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin 0 -> 28904 bytes
>  roms/Makefile                                |  48 ++++++++++++++-----
>  roms/opensbi                                 |   1 +
>  7 files changed, 44 insertions(+), 13 deletions(-)
>  create mode 100644 pc-bios/opensbi-riscv32-virt-fw_jump.bin
>  create mode 100644 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
>  create mode 100644 pc-bios/opensbi-riscv64-virt-fw_jump.bin
>  create mode 160000 roms/opensbi
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

