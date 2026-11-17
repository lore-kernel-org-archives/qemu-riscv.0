Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A1E606A32C
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=KjI29toi
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTFjy-0006KQ-NG; Tue, 17 Nov 2026 04:44:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTFjw-0006Gg-Og
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 04:44:36 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTFjt-0007OQ-O3
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 04:44:36 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6b85b58d303so93382a12.0
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 01:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1794908672; x=1795513472; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=2NJw67g8q7VHjym6XyMuC/ceoYqnWkhkfrkFMihuVCM=;
 b=KjI29toiGbMbXJzHPd49RQ5U3fa2WrCsnp4nKTG0wDI85HaPg24+coEFx0Xfc7m7Se
 LdBWqD4mFQbyTjAlJB+tWfHaTvMMuG1WDvIGZOYX9RQqPJBFNZefjwkz93BD42D8oAUG
 1OFNcwN/PMtR4eJmL0Lf2pTCnbeSq8N8UreVXkJDAbP9WAEfla3rSi21KgEZ7vWzO3mU
 e9PPeTnrQ3NgLLwBS3XYk9NqJNXzQnwyVbnI+AOe7uzHfLYd2LEmHSm8w1sqFIgaSKAu
 7lG6Xy7zZhTmTJnF8Vv+MOtOHUAOxEMISvEnM2x1g6uBeuSB6j/1JqO64F2OSRpSEjTT
 Qvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794908672; x=1795513472;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=2NJw67g8q7VHjym6XyMuC/ceoYqnWkhkfrkFMihuVCM=;
 b=EbLZAK5v2O5WelNNR9NpqjWAcFXM0p7gjlLv9L1OG0tZ5RyL8vwoHiGdkbwREjDnQS
 Nka+JmOruKcwyde0hCbs1jTyWckD03vupMXXohuT1+mmZl09ojh+iS8XgeYMpg3XicLm
 3JPJYEFl1OWI1kww0omUaw6fBOYKe/eryYZX4ot5pwnRdsvt4Yl9JuTmCJavhX1UPyt8
 n18TqTYfGyKEzU1xYFEimdcH5YP8/MhnNcuruuMe9nD7KrmEgnaQ0aOMPJ7NARfWwbyv
 L4/1SAlN4OQXVv8EnFwwstPM5usOutKUarRdb9zAK7KtOVW4QwGkDLyL9VgjvW8kJBkS
 epVg==
X-Forwarded-Encrypted: i=1;
 AL+hErERTV1bDOLuTRCVmsro207t64hC/WROnsiXpSZv/GBWcXveAGx/107b4/vbDbG9jrSzhKqI3bq5+kYW@nongnu.org
X-Gm-Message-State: APuU4Z8fC3PBQ88wEmqHPpEAGM5yDg6ZW/GP+GhXCYKy2i6a23CH/OY6
 xRPODWEHMo/V01NZfFYmnLaxpa/GTCjhfdd66j6T08tE8+ZAyqanqkqISZ5ozzmKLFRyzeze5R8
 izDEvtjyipZUCt8SjriGFJzjbKvkaE47i7zofP6lL/tx5hl+J8/bNIn+1muzJ8TB5HmTky6AAS8
 LLl/xtPOWDuh5w2tpALfpLhBaPI7FBtQM8pv79r0fVyfI=
X-Gm-Gg: AYBFou3Am4x2Q8pR3JeJbbOgIF9a0BngoIn8nbmO9ahbDOs9A2XfIn+ix7/4JW/OBYV
 380ZZLqGy0YfCxzUTkhll0Uhq6ImZqvL9tMVI4EHDZqakmawGPn45gY5BOjy0qoAJAoCiTej5qE
 QojQeRCHqUPfCMpSypq7A3FI1GNVkvVOVbteTCe2fDaLus3dbMNZd0AWe92Jp8HySzwZMDWbpSj
 SXI5qPBcxGqL3fzp1ibw6Wa9qZocmyP+YVx0TuTU5YuEMB/iL5IubUU4k9S8Y7k/fTJWlwiBkNp
 2CO+lq/sLSgfAVKlZmFGCbs1AGlc7lbHHcPaDVshiYPG8RJevypUgFtDgFLt1J3D8dHLVHtNe+S
 CN/1azxLRBYQnfcUss9sJ9/tSYALLuPYrL/WQeo0iGiUcx//Qx13RQiELRIFUMnhBSA10K5l2Ot
 V89huW9HiTLufrYqgeWtj6MLoqbA/QV7xXg7zldpHDl/yRHiRIxozck4FvOr7miusG6tY3FeXG3
 zB6urcs0ZxUQd3IwvOFVJ9w9Nmh2CELOjteIPHUxTI8LEC6QA35KPYVNwd4C2AVHBInp6pE7mRm
 TyQErlb0g9bSKYPGMTgAddUp7LxkTPb1V64CYZsNT28eC4HsqH/kYwVf1Z1w+jls3oZmbpgYmB0
 U7g6Pk2q4DCbNUA==
X-Received: by 2002:a05:6402:a6d4:10b0:6b7:c855:f2ff with SMTP id
 4fb4d7f45d1cf-6b8595bfce6mr1152025a12.2.1794908672218; 
 Tue, 17 Nov 2026 01:44:32 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b7c25de959sm5731550a12.29.2026.11.17.01.44.30
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 01:44:31 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-6b87a1a2babso232061a12.0
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 01:44:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AL+hErET0FwdFHvElI9STZmo1ABJaMHRTKN2rl4ciHpaj4uBmW5GYQxIt5UIVmnY0ujT1vMEED2AhEf2w2pG@nongnu.org
X-Received: by 2002:a05:6402:c4c9:20b0:6b7:b151:fe60 with SMTP id
 4fb4d7f45d1cf-6b8590dfa06mr1129048a12.0.1794908670381; Tue, 17 Nov 2026
 01:44:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260825-upstream-ntrace_core-v1-0-f8be2f40d2fd@gmail.com>
 <20260825-upstream-ntrace_core-v1-9-f8be2f40d2fd@gmail.com>
In-Reply-To: <20260825-upstream-ntrace_core-v1-9-f8be2f40d2fd@gmail.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Tue, 17 Nov 2026 17:44:18 +0800
X-Gmail-Original-Message-ID: <CAMXXpfaxzNHpnCJ5BU877hUcx3-euXS_jwHEL5Jg_1tAz95AKw@mail.gmail.com>
X-Gm-Features: AclHuK_rFDUpyTHGCytzhGkq5W4Jj7yNNf3hMKQJd2w4Q9lJBp-gGfk9XiMfHeY
Message-ID: <CAMXXpfaxzNHpnCJ5BU877hUcx3-euXS_jwHEL5Jg_1tAz95AKw@mail.gmail.com>
Subject: Re: [PATCH 09/13] hw/riscv: add n-trace ProgTraceCorrelation
 rv-trace-message
To: Konstantin Semichastnov <antikostya2@gmail.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexei Filippov <halip0503@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b3d603066075bd42"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=jay.chang@sifive.com; helo=mail-ed1-x533.google.com
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000b3d603066075bd42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Jay Chang<jay.chang@sifive.com>
Thanks

On Tue, Aug 25, 2026 at 10:49=E2=80=AFPM Konstantin Semichastnov <
antikostya2@gmail.com> wrote:

> Add generation, encoding and sending logic for N-Trace
> ProgTraceCorrelation message.
>
> Signed-off-by: Konstantin Semichastnov <antikostya2@gmail.com>
> ---
>  hw/riscv/rv-trace-messages.c | 40 ++++++++++++++++++++++++++++++++++++++=
++
>  hw/riscv/rv-trace-messages.h |  4 ++++
>  hw/riscv/trace-encoder.c     | 28 ++++++++++++++++++++++++++++
>  hw/riscv/trace-encoder.h     |  8 ++++++++
>  4 files changed, 80 insertions(+)
>
> diff --git a/hw/riscv/rv-trace-messages.c b/hw/riscv/rv-trace-messages.c
> index 8a9a3c6955..708e48bbed 100644
> --- a/hw/riscv/rv-trace-messages.c
> +++ b/hw/riscv/rv-trace-messages.c
> @@ -359,11 +359,14 @@ typedef enum {
>      WIDTH_FADDR  =3D 63,
>      WIDTH_UADDR  =3D 63,
>      WIDTH_HIST   =3D 32,
> +    WIDTH_EVCODE =3D 4,
> +    WIDTH_CDF    =3D 2,
>      WIDTH_RCODE  =3D 4,
>  } NTraceFieldWidth;
>
>  typedef enum {
>      TCODE_PROG_TRACE_SYNC        =3D 0x9,
> +    TCODE_PROG_TRACE_CORRELATION =3D 0x21,
>      TCODE_RESOURCE_FULL          =3D 0x1b,
>      TCODE_INDIRECT_BRANCH_HIST   =3D 0x1c,
>  } NTraceTcodeFieldValues;
> @@ -373,6 +376,10 @@ typedef enum {
>      SYNC_TRACE_ENABLED =3D 5,
>  } NTraceSyncFieldValues;
>
> +typedef enum {
> +    CDF_ICNT_AND_HIST_PRESENT =3D 1,
> +} NTraceCdfFieldValues;
> +
>  typedef enum {
>      RCODE_HIST_PRESENT =3D 1,
>  } NTraceRcodeFieldValues;
> @@ -432,6 +439,20 @@ typedef struct NTraceFieldPayload {
>          .value =3D (val),      \
>      }
>
> +#define PAYLOAD_EVCODE(val)    \
> +    {                          \
> +        .type =3D FIELD_FIXED,   \
> +        .width =3D WIDTH_EVCODE, \
> +        .value =3D (val),        \
> +    }
> +
> +#define PAYLOAD_CDF(val)     \
> +    {                        \
> +        .type =3D FIELD_FIXED, \
> +        .width =3D WIDTH_CDF,  \
> +        .value =3D (val),      \
> +    }
> +
>  #define PAYLOAD_RCODE(val)    \
>      {                         \
>          .type =3D FIELD_FIXED,  \
> @@ -531,6 +552,25 @@ size_t
> rv_ntrace_gen_encoded_prog_trace_sync_msg(uint8_t *buf, uint64_t faddr)
>      return rv_ntrace_gen_encoded_msg(buf, msg_fields);
>  }
>
> +size_t rv_ntrace_gen_encoded_prog_trace_correlation_msg(uint8_t *buf,
> +                                                        uint32_t evcode,
> +                                                        uint32_t icnt,
> +                                                        uint32_t hist)
> +{
> +    const NTraceFieldPayload msg_fields[] =3D {
> +        PAYLOAD_TCODE(TCODE_PROG_TRACE_CORRELATION),
> +        /* SRC field is not supported for now */
> +        PAYLOAD_EVCODE(evcode),
> +        PAYLOAD_CDF(CDF_ICNT_AND_HIST_PRESENT),
> +        PAYLOAD_ICNT(icnt),
> +        PAYLOAD_HIST(hist),
> +        /* TSTAMP field is not supported for now */
> +        PAYLOAD_END(),
> +    };
> +
> +    return rv_ntrace_gen_encoded_msg(buf, msg_fields);
> +}
> +
>  size_t rv_ntrace_gen_encoded_resource_full_msg(uint8_t *buf, uint32_t
> hist)
>  {
>      const NTraceFieldPayload msg_fields[] =3D {
> diff --git a/hw/riscv/rv-trace-messages.h b/hw/riscv/rv-trace-messages.h
> index 7ed8737d14..a4d14de59a 100644
> --- a/hw/riscv/rv-trace-messages.h
> +++ b/hw/riscv/rv-trace-messages.h
> @@ -38,6 +38,10 @@ size_t rv_etrace_gen_encoded_format1(uint8_t *buf,
>                                       bool notify, bool updiscon);
>
>  size_t rv_ntrace_gen_encoded_prog_trace_sync_msg(uint8_t *buf, uint64_t
> faddr);
> +size_t rv_ntrace_gen_encoded_prog_trace_correlation_msg(uint8_t *buf,
> +                                                        uint32_t evcode,
> +                                                        uint32_t icnt,
> +                                                        uint32_t hist);
>  size_t rv_ntrace_gen_encoded_resource_full_msg(uint8_t *buf, uint32_t
> hist);
>  size_t rv_ntrace_gen_indirect_branch_hist_msg(uint8_t *buf, uint8_t btyp=
e,
>                                                uint32_t icnt, uint64_t
> uaddr,
> diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c
> index 302458bfba..c36d205f50 100644
> --- a/hw/riscv/trace-encoder.c
> +++ b/hw/riscv/trace-encoder.c
> @@ -259,6 +259,16 @@ static void trencoder_te_ctrl_postw(RegisterInfo
> *reg, uint64_t val)
>      RISCVCPU *cpu =3D te->cpu;
>      CPURISCVState *env =3D &cpu->env;
>
> +
> +    if (te->ntrace && te->enabled) {
> +        if (!trTeActive || !trTeEnable || !trTeInstTracing) {
> +            uint32_t inst_len =3D get_inst_len_at(env->pc);
> +
> +            trencoder_send_prog_trace_correlation(OBJECT(te), env->pc,
> inst_len,
> +
> CORRELATION_TRACE_DISABLED);
> +        }
> +    }
> +
>      if (!trTeActive) {
>          te->enabled =3D false;
>          te->trace_running =3D false;
> @@ -658,6 +668,24 @@ static uint32_t
> rv_ntrace_get_and_reset_icnt(TraceEncoder *trencoder,
>      return icnt;
>  }
>
> +void trencoder_send_prog_trace_correlation(Object *trencoder_obj,
> uint64_t pc,
> +                                           uint32_t inst_len,
> +                                           TraceStopReason evcode)
> +{
> +    TraceEncoder *trencoder =3D TRACE_ENCODER(trencoder_obj);
> +    g_autofree uint8_t *msg =3D g_malloc0(TRACE_MSG_MAX_SIZE);
> +    uint32_t icnt =3D rv_ntrace_get_and_reset_icnt(trencoder, pc, inst_l=
en);
> +    uint32_t hist =3D rv_ntrace_encode_and_reset_branch_map(trencoder);
> +    uint8_t msg_size;
> +
> +    g_assert(trencoder->ntrace);
> +
> +    msg_size =3D rv_ntrace_gen_encoded_prog_trace_correlation_msg(msg,
> evcode,
> +                                                                icnt,
> hist);
> +
> +    trencoder_send_message_smem(trencoder, msg, msg_size);
> +}
> +
>  void trencoder_trace_trap_insn(Object *trencoder_obj, uint64_t curr_pc,
>                                 uint64_t target_pc, uint32_t ecause,
>                                 bool is_interrupt, uint64_t tval)
> diff --git a/hw/riscv/trace-encoder.h b/hw/riscv/trace-encoder.h
> index d1ff813035..55d53c2582 100644
> --- a/hw/riscv/trace-encoder.h
> +++ b/hw/riscv/trace-encoder.h
> @@ -63,12 +63,20 @@ typedef enum {
>      BTYPE_INTERRUPT    =3D 3,
>  } TraceBranchType;
>
> +typedef enum {
> +    CORRELATION_TRACE_DISABLED =3D 4,
> +} TraceStopReason;
> +
>  #define TYPE_TRACE_ENCODER "trace-encoder"
>
>  OBJECT_DECLARE_SIMPLE_TYPE(TraceEncoder, TRACE_ENCODER)
>
>  void trencoder_set_first_trace_insn(Object *trencoder_obj, uint64_t pc);
>  void trencoder_send_prog_trace_sync(Object *trencoder_obj, uint64_t pc);
> +void trencoder_send_prog_trace_correlation(Object *trencoder_obj,
> +                                           uint64_t pc,
> +                                           uint32_t inst_len,
> +                                           TraceStopReason evcode);
>  void trencoder_send_indirect_branch_hist(TraceEncoder *trencoder,
>                                           uint64_t curr_pc,
>                                           uint32_t curr_inst_len,
>
> --
> 2.43.0
>
>
>

--000000000000b3d603066075bd42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Jay Chang&lt;<a href=3D"mailto:jay.chang@sifi=
ve.com" target=3D"_blank">jay.chang@sifive.com</a>&gt;<div>Thanks</div></di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Aug 25, 2026 at 10:49=E2=80=AFPM Konstantin Semic=
hastnov &lt;<a href=3D"mailto:antikostya2@gmail.com">antikostya2@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">A=
dd generation, encoding and sending logic for N-Trace<br>
ProgTraceCorrelation message.<br>
<br>
Signed-off-by: Konstantin Semichastnov &lt;<a href=3D"mailto:antikostya2@gm=
ail.com" target=3D"_blank">antikostya2@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/riscv/rv-trace-messages.c | 40 +++++++++++++++++++++++++++++++++++=
+++++<br>
=C2=A0hw/riscv/rv-trace-messages.h |=C2=A0 4 ++++<br>
=C2=A0hw/riscv/trace-encoder.c=C2=A0 =C2=A0 =C2=A0| 28 ++++++++++++++++++++=
++++++++<br>
=C2=A0hw/riscv/trace-encoder.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++++++<br>
=C2=A04 files changed, 80 insertions(+)<br>
<br>
diff --git a/hw/riscv/rv-trace-messages.c b/hw/riscv/rv-trace-messages.c<br=
>
index 8a9a3c6955..708e48bbed 100644<br>
--- a/hw/riscv/rv-trace-messages.c<br>
+++ b/hw/riscv/rv-trace-messages.c<br>
@@ -359,11 +359,14 @@ typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0WIDTH_FADDR=C2=A0 =3D 63,<br>
=C2=A0 =C2=A0 =C2=A0WIDTH_UADDR=C2=A0 =3D 63,<br>
=C2=A0 =C2=A0 =C2=A0WIDTH_HIST=C2=A0 =C2=A0=3D 32,<br>
+=C2=A0 =C2=A0 WIDTH_EVCODE =3D 4,<br>
+=C2=A0 =C2=A0 WIDTH_CDF=C2=A0 =C2=A0 =3D 2,<br>
=C2=A0 =C2=A0 =C2=A0WIDTH_RCODE=C2=A0 =3D 4,<br>
=C2=A0} NTraceFieldWidth;<br>
<br>
=C2=A0typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0TCODE_PROG_TRACE_SYNC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x=
9,<br>
+=C2=A0 =C2=A0 TCODE_PROG_TRACE_CORRELATION =3D 0x21,<br>
=C2=A0 =C2=A0 =C2=A0TCODE_RESOURCE_FULL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 0x1b,<br>
=C2=A0 =C2=A0 =C2=A0TCODE_INDIRECT_BRANCH_HIST=C2=A0 =C2=A0=3D 0x1c,<br>
=C2=A0} NTraceTcodeFieldValues;<br>
@@ -373,6 +376,10 @@ typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0SYNC_TRACE_ENABLED =3D 5,<br>
=C2=A0} NTraceSyncFieldValues;<br>
<br>
+typedef enum {<br>
+=C2=A0 =C2=A0 CDF_ICNT_AND_HIST_PRESENT =3D 1,<br>
+} NTraceCdfFieldValues;<br>
+<br>
=C2=A0typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0RCODE_HIST_PRESENT =3D 1,<br>
=C2=A0} NTraceRcodeFieldValues;<br>
@@ -432,6 +439,20 @@ typedef struct NTraceFieldPayload {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.value =3D (val),=C2=A0 =C2=A0 =C2=A0 \<b=
r>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+#define PAYLOAD_EVCODE(val)=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D FIELD_FIXED,=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .width =3D WIDTH_EVCODE, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .value =3D (val),=C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+#define PAYLOAD_CDF(val)=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D FIELD_FIXED, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .width =3D WIDTH_CDF,=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .value =3D (val),=C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0#define PAYLOAD_RCODE(val)=C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D FIELD_FIXED,=C2=A0 \<br>
@@ -531,6 +552,25 @@ size_t rv_ntrace_gen_encoded_prog_trace_sync_msg(uint8=
_t *buf, uint64_t faddr)<br>
=C2=A0 =C2=A0 =C2=A0return rv_ntrace_gen_encoded_msg(buf, msg_fields);<br>
=C2=A0}<br>
<br>
+size_t rv_ntrace_gen_encoded_prog_trace_correlation_msg(uint8_t *buf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t evcode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t icnt,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t hist)<br>
+{<br>
+=C2=A0 =C2=A0 const NTraceFieldPayload msg_fields[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PAYLOAD_TCODE(TCODE_PROG_TRACE_CORRELATION),<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* SRC field is not supported for now */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PAYLOAD_EVCODE(evcode),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PAYLOAD_CDF(CDF_ICNT_AND_HIST_PRESENT),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PAYLOAD_ICNT(icnt),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PAYLOAD_HIST(hist),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* TSTAMP field is not supported for now */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PAYLOAD_END(),<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 return rv_ntrace_gen_encoded_msg(buf, msg_fields);<br>
+}<br>
+<br>
=C2=A0size_t rv_ntrace_gen_encoded_resource_full_msg(uint8_t *buf, uint32_t=
 hist)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const NTraceFieldPayload msg_fields[] =3D {<br>
diff --git a/hw/riscv/rv-trace-messages.h b/hw/riscv/rv-trace-messages.h<br=
>
index 7ed8737d14..a4d14de59a 100644<br>
--- a/hw/riscv/rv-trace-messages.h<br>
+++ b/hw/riscv/rv-trace-messages.h<br>
@@ -38,6 +38,10 @@ size_t rv_etrace_gen_encoded_format1(uint8_t *buf,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool notify, bo=
ol updiscon);<br>
<br>
=C2=A0size_t rv_ntrace_gen_encoded_prog_trace_sync_msg(uint8_t *buf, uint64=
_t faddr);<br>
+size_t rv_ntrace_gen_encoded_prog_trace_correlation_msg(uint8_t *buf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t evcode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t icnt,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t hist);<br>
=C2=A0size_t rv_ntrace_gen_encoded_resource_full_msg(uint8_t *buf, uint32_t=
 hist);<br>
=C2=A0size_t rv_ntrace_gen_indirect_branch_hist_msg(uint8_t *buf, uint8_t b=
type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0uint32_t icnt, uint64_t uaddr,<br>
diff --git a/hw/riscv/trace-encoder.c b/hw/riscv/trace-encoder.c<br>
index 302458bfba..c36d205f50 100644<br>
--- a/hw/riscv/trace-encoder.c<br>
+++ b/hw/riscv/trace-encoder.c<br>
@@ -259,6 +259,16 @@ static void trencoder_te_ctrl_postw(RegisterInfo *reg,=
 uint64_t val)<br>
=C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D te-&gt;cpu;<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
<br>
+<br>
+=C2=A0 =C2=A0 if (te-&gt;ntrace &amp;&amp; te-&gt;enabled) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!trTeActive || !trTeEnable || !trTeInstTra=
cing) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t inst_len =3D get_inst_l=
en_at(env-&gt;pc);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trencoder_send_prog_trace_correl=
ation(OBJECT(te), env-&gt;pc, inst_len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CORRELATION_TRACE_DISABLED);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (!trTeActive) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0te-&gt;enabled =3D false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0te-&gt;trace_running =3D false;<br>
@@ -658,6 +668,24 @@ static uint32_t rv_ntrace_get_and_reset_icnt(TraceEnco=
der *trencoder,<br>
=C2=A0 =C2=A0 =C2=A0return icnt;<br>
=C2=A0}<br>
<br>
+void trencoder_send_prog_trace_correlation(Object *trencoder_obj, uint64_t=
 pc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uint32_t inst_len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0TraceStopReason evcode)<br>
+{<br>
+=C2=A0 =C2=A0 TraceEncoder *trencoder =3D TRACE_ENCODER(trencoder_obj);<br=
>
+=C2=A0 =C2=A0 g_autofree uint8_t *msg =3D g_malloc0(TRACE_MSG_MAX_SIZE);<b=
r>
+=C2=A0 =C2=A0 uint32_t icnt =3D rv_ntrace_get_and_reset_icnt(trencoder, pc=
, inst_len);<br>
+=C2=A0 =C2=A0 uint32_t hist =3D rv_ntrace_encode_and_reset_branch_map(tren=
coder);<br>
+=C2=A0 =C2=A0 uint8_t msg_size;<br>
+<br>
+=C2=A0 =C2=A0 g_assert(trencoder-&gt;ntrace);<br>
+<br>
+=C2=A0 =C2=A0 msg_size =3D rv_ntrace_gen_encoded_prog_trace_correlation_ms=
g(msg, evcode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 icnt, hist);<br>
+<br>
+=C2=A0 =C2=A0 trencoder_send_message_smem(trencoder, msg, msg_size);<br>
+}<br>
+<br>
=C2=A0void trencoder_trace_trap_insn(Object *trencoder_obj, uint64_t curr_p=
c,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t target_pc, uint32_t ecause,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool is_interrupt, uint64_t tval)<br=
>
diff --git a/hw/riscv/trace-encoder.h b/hw/riscv/trace-encoder.h<br>
index d1ff813035..55d53c2582 100644<br>
--- a/hw/riscv/trace-encoder.h<br>
+++ b/hw/riscv/trace-encoder.h<br>
@@ -63,12 +63,20 @@ typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0BTYPE_INTERRUPT=C2=A0 =C2=A0 =3D 3,<br>
=C2=A0} TraceBranchType;<br>
<br>
+typedef enum {<br>
+=C2=A0 =C2=A0 CORRELATION_TRACE_DISABLED =3D 4,<br>
+} TraceStopReason;<br>
+<br>
=C2=A0#define TYPE_TRACE_ENCODER &quot;trace-encoder&quot;<br>
<br>
=C2=A0OBJECT_DECLARE_SIMPLE_TYPE(TraceEncoder, TRACE_ENCODER)<br>
<br>
=C2=A0void trencoder_set_first_trace_insn(Object *trencoder_obj, uint64_t p=
c);<br>
=C2=A0void trencoder_send_prog_trace_sync(Object *trencoder_obj, uint64_t p=
c);<br>
+void trencoder_send_prog_trace_correlation(Object *trencoder_obj,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uint64_t pc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uint32_t inst_len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0TraceStopReason evcode);<br>
=C2=A0void trencoder_send_indirect_branch_hist(TraceEncoder *trencoder,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
int64_t curr_pc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
int32_t curr_inst_len,<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
</blockquote></div>

--000000000000b3d603066075bd42--

