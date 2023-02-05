Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOoGN-0001V3-5I
	for mharc-qemu-riscv@gnu.org; Sun, 05 Feb 2023 18:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pOoGK-0001Uh-F4; Sun, 05 Feb 2023 18:17:33 -0500
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pOoGI-0005rx-VV; Sun, 05 Feb 2023 18:17:32 -0500
Received: by mail-vk1-xa32.google.com with SMTP id s76so5298618vkb.9;
 Sun, 05 Feb 2023 15:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Wo/ew5wLT2ktKtLyovD+4d+GlqXhaPV1dmUQydz3hIk=;
 b=U/l4t1Vy0FJd59Ma3QZp8KDwYyJ9S7GmhCaw/EZvLarpfYGI3uNExjZwyAaqP1/mk7
 /Sk2jAiOHFn0yXnFIGEsNLEeTBJ8j+Yc7F37/ZJVTAYc3Qj9knQa5ERVTecxboTlnTFG
 vy3hgc87biXDlLiU42TXCop+g3LGlQJcgm9Avnulu1szIUujmIVjkkFkOlOPbi4sIAxg
 TND7UlW9Gfe28oy653L8AGdJvP6zxBNg3aWXClpNYTMDsunFdvswIfnk5jPR0Ieivm6H
 XcNjuLNRktiAO9VLcWCSb55rlfYQfOu1rreYbxLf6UNRHNirifKVaiQe6+iEPLY8QCVo
 iWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wo/ew5wLT2ktKtLyovD+4d+GlqXhaPV1dmUQydz3hIk=;
 b=wc62sc7FwhrTiLMY1a9RDASSgQ0nFHbNq1XB3yNIcpifW8QgC7inxN289e9R9/kGgl
 Aw96ol4/9noEGDTGa5sTegOAdgnDkrAmO4bsxwgy+LytOdqNp8yTc5l6uHL1iP3eeH/d
 VzkfdwC+/lLV76CfIVynQ268VXaGJNl8bB/HLOa6xzkMnA+e7AQK7zwW6HGnxkwK5qbG
 pWdBhoeVn63iZtGZgY0m8rn0AQlwNrAOsPsue4M6+G4iVVT5aoTZ+G5MaCXhYLnUIuUN
 Sq7gV/TFcbpbhgD+HZMLttJphakPsmlJWuOD4U6xsmO80TOVe0so3Wnmj0O/wnbJwTiD
 sFvA==
X-Gm-Message-State: AO0yUKWxRqZ+JPSg2pDNRdXhy15JecP8FowfZQBleZo+fR8tOiEky5Vm
 QYLJZCmR4eFWo1RpC0tfPCCaQX9lCd38C3xyraQ=
X-Google-Smtp-Source: AK7set99RUPRNXnjPtKtcaXmrNKDgR0v95mdPQUMT0pL0ELGHhgq8Xec+x2wiRFutyhcKOgtgRtV/djC85nWOW34oYc=
X-Received: by 2002:ac5:c1c1:0:b0:3e5:7064:1bf9 with SMTP id
 g1-20020ac5c1c1000000b003e570641bf9mr2549015vkk.30.1675639049610; Sun, 05 Feb
 2023 15:17:29 -0800 (PST)
MIME-Version: 1.0
References: <20230203135155.12449-1-vladimir.isaev@syntacore.com>
In-Reply-To: <20230203135155.12449-1-vladimir.isaev@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Feb 2023 09:17:03 +1000
Message-ID: <CAKmqyKMpS7k=1oGt9L+E=BFbrXz_2yu1CcfAir27WO5BbgkbYg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix SBI getchar handler for KVM
To: Vladimir Isaev <vladimir.isaev@syntacore.com>
Cc: qemu-riscv@nongnu.org, pbonzini@redhat.com, bin.meng@windriver.com, 
 alistair.francis@wdc.com, palmer@dabbelt.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 05 Feb 2023 23:17:33 -0000

On Sat, Feb 4, 2023 at 12:03 AM Vladimir Isaev
<vladimir.isaev@syntacore.com> wrote:
>
> Character must be returned via ret[0] field (copied to a0 by KVM).
>
> Return value should be set to 0 to indicate successful processing.
>
> Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 30f21453d69c..0f932a5b966e 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -467,10 +467,11 @@ static int kvm_riscv_handle_sbi(CPUState *cs, struct kvm_run *run)
>      case SBI_EXT_0_1_CONSOLE_GETCHAR:
>          ret = qemu_chr_fe_read_all(serial_hd(0)->be, &ch, sizeof(ch));
>          if (ret == sizeof(ch)) {
> -            run->riscv_sbi.args[0] = ch;
> +            run->riscv_sbi.ret[0] = ch;
>          } else {
> -            run->riscv_sbi.args[0] = -1;
> +            run->riscv_sbi.ret[0] = -1;
>          }
> +        ret = 0;
>          break;
>      default:
>          qemu_log_mask(LOG_UNIMP,
> --
> 2.39.1
>
>

