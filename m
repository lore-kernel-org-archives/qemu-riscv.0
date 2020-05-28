Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1je8ND-0000D7-4G
	for mharc-qemu-riscv@gnu.org; Wed, 27 May 2020 22:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1je8NB-0000BN-AM; Wed, 27 May 2020 22:34:21 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:43745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1je8NA-0000p2-He; Wed, 27 May 2020 22:34:20 -0400
Received: by mail-yb1-xb43.google.com with SMTP id r23so8823811ybd.10;
 Wed, 27 May 2020 19:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+EgEVzd/XW0O7MqDUyua+HsyHcfUL9OZAefOab3aXqQ=;
 b=faxkPafutgclxehTSfNz4LD9oBbKcXMi8Qwyr68z7Qp8drNwETWYePUBmgSQPaRaVG
 eyopC0kUiOUdGXWRJPtXm9qkIoI89DaxdD+Ya3uSMfCHEfzj514W35XxVNfRTH7zy8oQ
 WnT5GomxbpKnCYhzh+pLbTdkxt7k5wpgTjDrX+tpqlEgXGuF+oKtK5bNMOSgY8MtKFvD
 xWm9T+V5e7/zRrOPRIGZurS6d8pqR6Dedbn3M8fiq5UDqhCLGYvzkGeBmQslAZAtGFEA
 GhAxCXE66dGLJUd1QUtzGEhSzdH7/Bj4lId8cxb3q13Naqc6j0QDNnJEhWGLbGwEa2aI
 JAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+EgEVzd/XW0O7MqDUyua+HsyHcfUL9OZAefOab3aXqQ=;
 b=c8hefbNCgUtKIHTdfVyCR7PPBsUKbsWnpNPUK7yYsppxc/dIko3+o+5JbyvBo6kWPk
 U3GphoWWIfQh9+/XaEZp4FhfKlHHMwJIsuewaZIhyJPt4tnxm6510RGHBN9UstHKqmLP
 up13CowzqiNIW/QjjAUL4j7oNhU95ULrbZDQtYdpJ5Bv+7Z0Ky51aOFL8m4mPKSx8To3
 VomxPBval1LtqYCaZ4Ih8irOGsPffWrSxbKmeONlJavNFB7Tn2apa+iVzvCYGV8JIBgB
 9MErnyIRMRJR4mUc2BDHR8oaefzdHYfMrIn8uJF7x1nr20D5aAu6TXHi5usFxNO1SIQi
 +P+Q==
X-Gm-Message-State: AOAM530O1GcJu2ToYlh6YmC+IIgXstxHY1R5c6LZjEl/g/OmZ9twsTbC
 gYOeFD5nSpwXQB5LQ3b4owV6EjOfyTVIZ4Ry/4I=
X-Google-Smtp-Source: ABdhPJyUfo70Kg20FpXHCq4NncBMsDhBZrNLV82jU07O62oZIDTQ37gSZ6M/OALwS1ulEOQQVVEgiR8bA9bSJw8A8dg=
X-Received: by 2002:a25:6d88:: with SMTP id i130mr1917379ybc.306.1590633259303; 
 Wed, 27 May 2020 19:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590598125.git.alistair.francis@wdc.com>
 <d65e90ab8ca5ee29ab26973c86a18549853a98cd.1590598125.git.alistair.francis@wdc.com>
In-Reply-To: <d65e90ab8ca5ee29ab26973c86a18549853a98cd.1590598125.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 28 May 2020 10:34:08 +0800
Message-ID: <CAEUhbmVGZjwoW+6P2iJ23N+J-gS9y-9R=0bL1-bg=nbsOogecg@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] target/riscv: Use a smaller guess size for
 no-MMU PMP
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b43;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 28 May 2020 02:34:21 -0000

On Thu, May 28, 2020 at 12:59 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/pmp.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

