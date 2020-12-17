Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpmuz-0006WS-0H
	for mharc-qemu-riscv@gnu.org; Thu, 17 Dec 2020 01:37:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpmuw-0006Th-SQ; Thu, 17 Dec 2020 01:37:38 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:46531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpmuu-0004of-TE; Thu, 17 Dec 2020 01:37:38 -0500
Received: by mail-yb1-xb32.google.com with SMTP id w135so24839223ybg.13;
 Wed, 16 Dec 2020 22:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=91Vn69e00se+Pi/bUPYaY/7OWBpiWjFCcbM48c6JOcU=;
 b=D8WhDmnXS3veQpSOc/OeQbSb1QiWvk2g7YPrM+LTKlIkc0LqX8pWox8+avagjpWAMM
 Au9KmAEyfkfKknJbrJHFZVR7jrIIuAxghXyvaTUFkmtY2lpAevE8uDQukmwPq+lzUSND
 bUO9CI5gsOyksvGUKdmIrI45hVpjsg08Wt5xngpVcyuZiGgARQe5L0RJuRZQREqKd7Ms
 DwdW+efh01B/fOFeLWzTPsWwi6R7A+n+t499eBRx0arpdIrp/+wqXQVWc/u9yiwjuD5a
 +rYGOee+Xd5yb475f9QbtIJPUTSn3PUXYm/H+zpNmWI+14ptLteKKmL2IGTos+CHgIvn
 YSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=91Vn69e00se+Pi/bUPYaY/7OWBpiWjFCcbM48c6JOcU=;
 b=jfUOAaKQpgpOpU7F7Pt8x1fb0Dh3rriliYMJ/SSb8iM4tGNHe4F9jio1gP5dbGNxEa
 to4LOvb3aN9ZdzBlLOyA09dmfR6n/oNk8POAqkfTQERc6j/QTXF1S2X9NUUuHc5zkugI
 tMcr2bf3CGsxDeRgGg9sNeXOvSjx1APiSgb/cAuQOsziUJB1D61S9p0m/O3iScCe19R3
 d+RWtaO5m/u7MK0dvlMGLzPxVJQ2uOI9j9wOHunBM6yaGjnfZ8/IHajJpktFKmIdJUey
 uh+cXYu+LpNn9IhDW1alTKYEncCImC21LmTIjugFZI9nJTlRLM/PBp9dNLLs6zHmIeXK
 MEng==
X-Gm-Message-State: AOAM532X0WsV39kZAfHKBQCye37yfls05pgDxF5lXWPhSbfXBnOZBpcT
 ccD+rm7cCAFcfvWYBCPe/cwGHWDttzRiMdAaFbM=
X-Google-Smtp-Source: ABdhPJwmMIIKQFRe3YmoMsf/gupFYXi3i9Nll7hovHZ4aKA00McYIo8gdbYxSrTnry5E5/JtrsUSKZGzfJxVeTldlt0=
X-Received: by 2002:a25:be87:: with SMTP id i7mr54012199ybk.332.1608187055637; 
 Wed, 16 Dec 2020 22:37:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608142916.git.alistair.francis@wdc.com>
 <7371180970b7db310d3a1da21d03d33499c2beb0.1608142916.git.alistair.francis@wdc.com>
In-Reply-To: <7371180970b7db310d3a1da21d03d33499c2beb0.1608142916.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 17 Dec 2020 14:37:24 +0800
Message-ID: <CAEUhbmVe+R3EPqQ-Ni0YB_1uuUd+U0xFGwbovYOmoVn19codsg@mail.gmail.com>
Subject: Re: [PATCH v4 14/16] target/riscv: csr: Remove compile time XLEN
 checks
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 17 Dec 2020 06:37:39 -0000

On Thu, Dec 17, 2020 at 2:23 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  target/riscv/cpu_bits.h |   4 +-
>  target/riscv/csr.c      | 176 +++++++++++++++++++++-------------------
>  2 files changed, 92 insertions(+), 88 deletions(-)
>

Tested-by: Bin Meng <bin.meng@windriver.com>

