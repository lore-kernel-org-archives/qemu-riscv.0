Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mz8nB-0002U0-F6
	for mharc-qemu-riscv@gnu.org; Sun, 19 Dec 2021 21:52:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mz8nA-0002Tk-Cm; Sun, 19 Dec 2021 21:52:48 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=44767
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mz8n8-0001R2-VS; Sun, 19 Dec 2021 21:52:48 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id q74so24354532ybq.11;
 Sun, 19 Dec 2021 18:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MWlG1VTfSBZ2h8nSo2wVFCnWYGbM9bt0M1S6zZYk9RA=;
 b=XX0JV0y4WKsFGIfL2vOGZHjRNM0DoLuox+oQCqM+cXtDgWW8G9B1pKs2OvpW5MkbSh
 AIFsP9pRlzTRxiUJRh7h1SWwUhZGq6jOUwhFlfdqEpf7wGy0yr1H3fM2vTcDreEn6JpV
 eW9ZRJjSE2grn1B/wxU7vWH01kjkOPjDXWJ8o/AiyUbCfdOJiwvXGORE+PA7PcpjL3IG
 XHW9P8gXamM5dMSb4+DLGaEmf5sfclDJdnfU5NBwE8/HH9Vzyt1x8BNcVtvKYEP+Eu+V
 jtQ9IONSk2ApvH4IS5Wol6swNCvR+yCH5dFXiwGoJ83u6cIloJO4orAUf/pWghi534la
 8hDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MWlG1VTfSBZ2h8nSo2wVFCnWYGbM9bt0M1S6zZYk9RA=;
 b=1tiV+WTB3YmJF1bEiL0IfYVxlvsKsH6spugh3Pi3jncD3DOPjVE4qBK/ITEYSdDBA8
 FUJWtWxcKpY61PJLWjywpfSHl5w5ViWTYM4Zt30wLHEN4eSNwR8DLyAECapX3RpoWHju
 yuXAGVONPEZbjHOw9CU6C3xum0p1bWVLPJwB6fzQOY6VNsKDeYqdsLUPw3WSFKBoqa9m
 rOVBajnXeT1NZg8lcqtulsjzaE7Q1ZVQ87+nzZAN+qUq0D+9nUqNdsJ/OKcD7LhbpubI
 /8W/MMd4Y9+aXNhhdNv+BD7qGURqi9Z921ulWph4nFL7stN/aM5I4z5dnQlK2ZHGFVzf
 qRnA==
X-Gm-Message-State: AOAM533eGXPK2xuF8qqdAZifwEQs5j2lRyJE1+bqbUTxXjAo2ttlJz/N
 H1G+8kp0tsSKtvWlxCcPc1zu3VtZvWQb4ekqhBQ=
X-Google-Smtp-Source: ABdhPJyFjVLDqXh9712gykq8bycTtJB8QIhy8gT7sAtqlRH5IMQhvjxmM6XVKu80eO//pprsMciuGK9WoehAsu0nwVI=
X-Received: by 2002:a25:d048:: with SMTP id h69mr20851089ybg.747.1639968765523; 
 Sun, 19 Dec 2021 18:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-6-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211216045427.757779-6-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 20 Dec 2021 10:52:34 +0800
Message-ID: <CAEUhbmX92KBJLq9aJ9CoMnT_ogpvJ=FXXTqPOkNjgFiF17fe=A@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] target/riscv: Mark the Hypervisor extension as non
 experimental
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 20 Dec 2021 02:52:48 -0000

On Thu, Dec 16, 2021 at 12:55 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The Hypervisor spec is now frozen, so remove the experimental tag.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

