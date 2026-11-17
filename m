Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D680C606A329
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=ZiaFSTfg
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTFfR-0005Gy-IQ; Tue, 17 Nov 2026 04:39:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTFfP-0005Ga-7l
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 04:39:55 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTFfN-0000uK-2G
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 04:39:54 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c505b2e1cb9so650822866b.2
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 01:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1794908391; x=1795513191; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=7WvqTuXbUhpWlFGZWnVfHUTHePiaHeFofmnkw7ZzuPc=;
 b=ZiaFSTfg/CrWiTcN5MANbpiaTmhejvBc5yLJ0omPRXVJbdxO+HPaT3spgrdVXxdKiV
 jemVMgMnGWUFiySuB/Adm3NJrnNowvCCNtAZ1xmV78svxAg7Byn3MYrS/+9yZIxHjEGH
 vX736+mvNzk2wtlaBxrcEgFcCQwIGByyTcaLc/QFy3aHPOwCGcMrrgjpGDWn6/5NdZpW
 Kfmv1gusRts/pCkIRbpuTB6jv+QSfQaPFoW1PQ3lLNqtV9fx14Qc7yqKrG59B4/LQZK/
 NBJ13YYpnZhfianipO5tYaPe9pYRute3mjspupOVEx740xBNU0wo9tMKpThzUqARpmyK
 PzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794908391; x=1795513191;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=7WvqTuXbUhpWlFGZWnVfHUTHePiaHeFofmnkw7ZzuPc=;
 b=LfMv5g3QF2E4//2NMDQcmP0JrpN/z4dVLZPRpFVdx/F+TU3qXSnoH6uKb0avfIw1iW
 P2XonuZLhXkUFT00FvVyunvgDVGfUnXnHmgkk6wk/4xVyIDj/N57cvrYe3igMwN6w1/K
 mwkLEaeWcymcVQN/1Tbnd4GO6qa2EKUUak7aAObNH1Bq6S4eLCTrXyozxjKowzHMnRxP
 fGRKn1L3a8hzFwgS8tKAJHUcJONYO3ngs16OdJXAk/Mt13ocj75GMsMzmPkzjl7hWNv4
 0v2o5CVd9n/T0g+kmC29TQO1srvBAAF3uQbMsNhi7n0EIPyBM58gosu+W5W6YNqMXqas
 2N/A==
X-Forwarded-Encrypted: i=1;
 AL+hErHbOlDZnYb79/7tsSHNAYJHHRXn7g7+elVpNFPwuXQeLSfwTmgd1NWlzF1S2fJakVmVfk0enklFns83@nongnu.org
X-Gm-Message-State: APuU4Z+MCf2RSzrD4ZFMNOwQDQm1tCEWeULRn9H5Zn3VarQNWIp7ip47
 TFXjWlPJ1avyXyiGw9U+8gOQZShdWvoh+DSsyh713uGLkrvvw2GZ5/2Hh0A4zxdFFcl+SGyNa2E
 9w30a8rMN9CpCEXxHqvRpXSxscaLuON7a0OmhbO1IytCHPTIQEI15iR45qH7oSWg6F+HxmwmVQo
 qoXDG8uQvb7TfRUyQF3QZ7KaMe1QiP8/tcb/aJhNtUgmc=
X-Gm-Gg: AYBFou0kJOF+HA/cqNWfxuL0SMc9Sm9uxMiiuP0CWsc4RCeG6wdaYNV0zoUrv4YAFUk
 6zg2jtwHPVsYKi1qcfg7oE81j4aphhgewQZva7YeAbRX07v6E6y9TidKGnhTw8f3Bz9cRkhlqe3
 97kJU0Jlo+4q9/ZDRu3rkOEh0d0MEeD4P3/g9Fzl4moc09EfrfZYR4usbkrBGnnjsaw++ZIPKYN
 pT6BUq6mXvIdUNzMqb8OCC/LZS0RTeaRDqDxQtgOBRtftA4t9JCjqOlvkCpaZHnsWRqnrDowf7s
 PMyFFl650S6hLRcUile/vbBeYYf4AdE24u/mcaY+jIxi9GXS2uU2uTgCbBbjIeuBkKLejcVwZb7
 RRk3xn80otAdPIc13GmZCi26k92M6gC05HnJWormSuwp1KO7Y+NXaXZdRxzgxdQ+dSeGg0KvOZr
 swJGjM4DuIU1NPZBIFnGyKyl1+J08OIx7+V0+YtRzXB6Cq9oqAYGHJouyiQ357rar5h+e3DdgNg
 GdyHqzl+fuZONvbjbP1V8zyeCKf4QMoGu0xcwXgP/eu2/P56ibnh/0CMQrye73FGblPxFGEGMU0
 jBeJAy9wOEWsIYyms0jKKJSgu7Njn5j3xZmKS5lSsnnOUBu8+BDE65lVAVEwlFT6JRw=
X-Received: by 2002:a17:907:968b:b0:c31:7495:e57 with SMTP id
 a640c23a62f3a-c50963f37cbmr1107004266b.44.1794908391283; 
 Tue, 17 Nov 2026 01:39:51 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b7eb14sm524858966b.75.2026.11.17.01.39.50
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 01:39:50 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6b75712fb57so5669540a12.2
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 01:39:50 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AL+hErF+RZ0E62YGcUSEOx2Vg8c+s8k8XOQEMug3yDr6Yf4/LQWaoR2YAQayGr1G6rxGh3WeWDCN+fXCKKPh@nongnu.org
X-Received: by 2002:a05:6402:540f:b0:6b3:c422:9257 with SMTP id
 4fb4d7f45d1cf-6b7c0c6e019mr11609216a12.25.1794908390086; Tue, 17 Nov 2026
 01:39:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260825-upstream-ntrace_core-v1-0-f8be2f40d2fd@gmail.com>
 <20260825-upstream-ntrace_core-v1-8-f8be2f40d2fd@gmail.com>
In-Reply-To: <20260825-upstream-ntrace_core-v1-8-f8be2f40d2fd@gmail.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Tue, 17 Nov 2026 17:39:38 +0800
X-Gmail-Original-Message-ID: <CAMXXpfYKa1tRjvhFpOo9qTUovP2KRq+og-1Ai2YAensCZfpTRQ@mail.gmail.com>
X-Gm-Features: AclHuK8XNMTfpYsPaP5irTfUGDy0bzHrBniJinP-0kDfMmhgOyUfBv4cAnJfUzs
Message-ID: <CAMXXpfYKa1tRjvhFpOo9qTUovP2KRq+og-1Ai2YAensCZfpTRQ@mail.gmail.com>
Subject: Re: [PATCH 08/13] hw/riscv: add n-trace ResourceFull rv-trace-message
To: Konstantin Semichastnov <antikostya2@gmail.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexei Filippov <halip0503@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000fedf10066075ac19"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=jay.chang@sifive.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000fedf10066075ac19
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Jay Chang<jay.chang@sifive.com>
Thanks

On Tue, Aug 25, 2026 at 10:49=E2=80=AFPM Konstantin Semichastnov <
antikostya2@gmail.com> wrote:

> Add generation, encoding and sending logic for N-Trace ResourceFull
> message.
>
> Signed-off-by: Konstantin Semichastnov <antikostya2@gmail.com>
> ---
>  hw/riscv/rv-trace-messages.c | 29 +++++++++++++++++++++++++++++
>  hw/riscv/rv-trace-messages.h |  1 +
>  hw/riscv/trace-encoder.c     |  5 +++--
>  3 files changed, 33 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/rv-trace-messages.c b/hw/riscv/rv-trace-messages.c
> index 2ee38c4354..8a9a3c6955 100644
> --- a/hw/riscv/rv-trace-messages.c
> +++ b/hw/riscv/rv-trace-messages.c
> @@ -359,10 +359,12 @@ typedef enum {
>      WIDTH_FADDR  =3D 63,
>      WIDTH_UADDR  =3D 63,
>      WIDTH_HIST   =3D 32,
> +    WIDTH_RCODE  =3D 4,
>  } NTraceFieldWidth;
>
>  typedef enum {
>      TCODE_PROG_TRACE_SYNC        =3D 0x9,
> +    TCODE_RESOURCE_FULL          =3D 0x1b,
>      TCODE_INDIRECT_BRANCH_HIST   =3D 0x1c,
>  } NTraceTcodeFieldValues;
>
> @@ -371,6 +373,10 @@ typedef enum {
>      SYNC_TRACE_ENABLED =3D 5,
>  } NTraceSyncFieldValues;
>
> +typedef enum {
> +    RCODE_HIST_PRESENT =3D 1,
> +} NTraceRcodeFieldValues;
> +
>  typedef struct NTraceFieldPayload {
>      NTraceFieldType type;
>      NTraceFieldWidth width;
> @@ -425,6 +431,14 @@ typedef struct NTraceFieldPayload {
>          .width =3D WIDTH_HIST, \
>          .value =3D (val),      \
>      }
> +
> +#define PAYLOAD_RCODE(val)    \
> +    {                         \
> +        .type =3D FIELD_FIXED,  \
> +        .width =3D WIDTH_RCODE, \
> +        .value =3D (val),       \
> +    }
> +
>  #define PAYLOAD_END()      \
>      {                      \
>          .type =3D FIELD_END, \
> @@ -517,6 +531,21 @@ size_t
> rv_ntrace_gen_encoded_prog_trace_sync_msg(uint8_t *buf, uint64_t faddr)
>      return rv_ntrace_gen_encoded_msg(buf, msg_fields);
>  }
>
> +size_t rv_ntrace_gen_encoded_resource_full_msg(uint8_t *buf, uint32_t
> hist)
> +{
> +    const NTraceFieldPayload msg_fields[] =3D {
> +        PAYLOAD_TCODE(TCODE_RESOURCE_FULL),
> +        /* SRC field is not supported for now */
> +        PAYLOAD_RCODE(RCODE_HIST_PRESENT),
> +        /* I-CNT overflow is not supported for now */
> +        PAYLOAD_HIST(hist),
> +        /* TSTAMP field is not supported for now */
> +        PAYLOAD_END(),
> +    };
> +
> +    return rv_ntrace_gen_encoded_msg(buf, msg_fields);
> +}
> +
>  size_t rv_ntrace_gen_indirect_branch_hist_msg(uint8_t *buf, uint8_t btyp=
e,
>                                                uint32_t icnt, uint64_t
> uaddr,
>                                                uint32_t hist)
> diff --git a/hw/riscv/rv-trace-messages.h b/hw/riscv/rv-trace-messages.h
> index d113129d65..7ed8737d14 100644
> --- a/hw/riscv/rv-trace-messages.h
> +++ b/hw/riscv/rv-trace-messages.h
> @@ -38,6 +38,7 @@ size_t rv_etrace_gen_encoded_format1(uint8_t *buf,
>                                       bool notify, bool updiscon);
>
>  size_t rv_ntrace_gen_encoded_prog_trace_sync_msg(uint8_t *buf, uint64_t
> faddr);
> +size_t rv_ntrace_gen_encoded_resource_full_msg(uint8_t *buf, uint32_t
> hist);
>  size_t rv_ntrace_gen_indirect_branch_hist_msg(uint8_t *buf, uint8_t btyp=
e,
>                                                uint32_t icnt, uint64_t
> uaddr,
>                                                uint32_t hist);
> diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c
> index face6f83b7..302458bfba 100644
> --- a/hw/riscv/trace-encoder.c
> +++ b/hw/riscv/trace-encoder.c
> @@ -694,8 +694,9 @@ static void trencoder_send_branch_map(Object
> *trencoder_obj)
>      uint8_t msg_size;
>
>      if (te->ntrace) {
> -        /* send ResourceFull message */
> -        return;
> +        uint32_t hist =3D rv_ntrace_encode_and_reset_branch_map(te);
> +
> +        msg_size =3D rv_ntrace_gen_encoded_resource_full_msg(msg, hist);
>      } else {
>          msg_size =3D rv_etrace_gen_encoded_format1_noaddr(msg,
>                                                          te->branches,
>
> --
> 2.43.0
>
>
>

--000000000000fedf10066075ac19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Jay Chang&lt;<a href=3D"mailto:jay.chang@sifi=
ve.com" target=3D"_blank">jay.chang@sifive.com</a>&gt;<div>Thanks</div></di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Aug 25, 2026 at 10:49=E2=80=AFPM Konstantin Semic=
hastnov &lt;<a href=3D"mailto:antikostya2@gmail.com">antikostya2@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">A=
dd generation, encoding and sending logic for N-Trace ResourceFull<br>
message.<br>
<br>
Signed-off-by: Konstantin Semichastnov &lt;<a href=3D"mailto:antikostya2@gm=
ail.com" target=3D"_blank">antikostya2@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/riscv/rv-trace-messages.c | 29 +++++++++++++++++++++++++++++<br>
=C2=A0hw/riscv/rv-trace-messages.h |=C2=A0 1 +<br>
=C2=A0hw/riscv/trace-encoder.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++--<br>
=C2=A03 files changed, 33 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/riscv/rv-trace-messages.c b/hw/riscv/rv-trace-messages.c<br=
>
index 2ee38c4354..8a9a3c6955 100644<br>
--- a/hw/riscv/rv-trace-messages.c<br>
+++ b/hw/riscv/rv-trace-messages.c<br>
@@ -359,10 +359,12 @@ typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0WIDTH_FADDR=C2=A0 =3D 63,<br>
=C2=A0 =C2=A0 =C2=A0WIDTH_UADDR=C2=A0 =3D 63,<br>
=C2=A0 =C2=A0 =C2=A0WIDTH_HIST=C2=A0 =C2=A0=3D 32,<br>
+=C2=A0 =C2=A0 WIDTH_RCODE=C2=A0 =3D 4,<br>
=C2=A0} NTraceFieldWidth;<br>
<br>
=C2=A0typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0TCODE_PROG_TRACE_SYNC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x=
9,<br>
+=C2=A0 =C2=A0 TCODE_RESOURCE_FULL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x=
1b,<br>
=C2=A0 =C2=A0 =C2=A0TCODE_INDIRECT_BRANCH_HIST=C2=A0 =C2=A0=3D 0x1c,<br>
=C2=A0} NTraceTcodeFieldValues;<br>
<br>
@@ -371,6 +373,10 @@ typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0SYNC_TRACE_ENABLED =3D 5,<br>
=C2=A0} NTraceSyncFieldValues;<br>
<br>
+typedef enum {<br>
+=C2=A0 =C2=A0 RCODE_HIST_PRESENT =3D 1,<br>
+} NTraceRcodeFieldValues;<br>
+<br>
=C2=A0typedef struct NTraceFieldPayload {<br>
=C2=A0 =C2=A0 =C2=A0NTraceFieldType type;<br>
=C2=A0 =C2=A0 =C2=A0NTraceFieldWidth width;<br>
@@ -425,6 +431,14 @@ typedef struct NTraceFieldPayload {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.width =3D WIDTH_HIST, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.value =3D (val),=C2=A0 =C2=A0 =C2=A0 \<b=
r>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+#define PAYLOAD_RCODE(val)=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D FIELD_FIXED,=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .width =3D WIDTH_RCODE, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .value =3D (val),=C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0#define PAYLOAD_END()=C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D FIELD_END, \<br>
@@ -517,6 +531,21 @@ size_t rv_ntrace_gen_encoded_prog_trace_sync_msg(uint8=
_t *buf, uint64_t faddr)<br>
=C2=A0 =C2=A0 =C2=A0return rv_ntrace_gen_encoded_msg(buf, msg_fields);<br>
=C2=A0}<br>
<br>
+size_t rv_ntrace_gen_encoded_resource_full_msg(uint8_t *buf, uint32_t hist=
)<br>
+{<br>
+=C2=A0 =C2=A0 const NTraceFieldPayload msg_fields[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PAYLOAD_TCODE(TCODE_RESOURCE_FULL),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* SRC field is not supported for now */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PAYLOAD_RCODE(RCODE_HIST_PRESENT),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* I-CNT overflow is not supported for now */<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PAYLOAD_HIST(hist),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* TSTAMP field is not supported for now */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PAYLOAD_END(),<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 return rv_ntrace_gen_encoded_msg(buf, msg_fields);<br>
+}<br>
+<br>
=C2=A0size_t rv_ntrace_gen_indirect_branch_hist_msg(uint8_t *buf, uint8_t b=
type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0uint32_t icnt, uint64_t uaddr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0uint32_t hist)<br>
diff --git a/hw/riscv/rv-trace-messages.h b/hw/riscv/rv-trace-messages.h<br=
>
index d113129d65..7ed8737d14 100644<br>
--- a/hw/riscv/rv-trace-messages.h<br>
+++ b/hw/riscv/rv-trace-messages.h<br>
@@ -38,6 +38,7 @@ size_t rv_etrace_gen_encoded_format1(uint8_t *buf,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool notify, bo=
ol updiscon);<br>
<br>
=C2=A0size_t rv_ntrace_gen_encoded_prog_trace_sync_msg(uint8_t *buf, uint64=
_t faddr);<br>
+size_t rv_ntrace_gen_encoded_resource_full_msg(uint8_t *buf, uint32_t hist=
);<br>
=C2=A0size_t rv_ntrace_gen_indirect_branch_hist_msg(uint8_t *buf, uint8_t b=
type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0uint32_t icnt, uint64_t uaddr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0uint32_t hist);<br>
diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c<br>
index face6f83b7..302458bfba 100644<br>
--- a/hw/riscv/trace-encoder.c<br>
+++ b/hw/riscv/trace-encoder.c<br>
@@ -694,8 +694,9 @@ static void trencoder_send_branch_map(Object *trencoder=
_obj)<br>
=C2=A0 =C2=A0 =C2=A0uint8_t msg_size;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (te-&gt;ntrace) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* send ResourceFull message */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t hist =3D rv_ntrace_encode_and_reset_b=
ranch_map(te);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg_size =3D rv_ntrace_gen_encoded_resource_fu=
ll_msg(msg, hist);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg_size =3D rv_etrace_gen_encoded_format=
1_noaddr(msg,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0te-&gt;branches,<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
</blockquote></div>

--000000000000fedf10066075ac19--

