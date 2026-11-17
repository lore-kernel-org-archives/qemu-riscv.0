Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE974606A323
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=cHGCBbI3
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTFkc-0006hy-MD; Tue, 17 Nov 2026 04:45:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTFkZ-0006Y5-E1
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 04:45:15 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xTFkW-0007ex-B9
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 04:45:15 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c40f29667e6so778916766b.0
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 01:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1794908710; x=1795513510; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=NEigU4jij5r91/pxWG3XKGaw/mSVdbAML+VHi2kgWDc=;
 b=cHGCBbI3nH2EMR1+vFAy6rQFLJiKqfDEfhV4MHTk2t9imUsTtxzxYlnRGFXLti100g
 pqh/9oOpBM92192bsm2CVX2wi/5HnGGtpWXghPdjXa1NjBLpgoIyM4oG2To+o8X/GqCK
 LgQM49zBNNts4Oy1mlSwMbUS82mmvdeeC8KfCnbTqDAeSz/JR0yGmj6zhOGaD/Fk3c/p
 pN6GukpSZuIWVHKog+IKAXOqObhU8BiaVBGMGo6ZzkPpYgET2g8Mzf5K/vCT2e2OkbNn
 xPY/9LRm8Nr0ibqVTRXoPcxeu3ev6J24Jp3qRPxs04qEQOG1SYF/DUxvoJ94D6a7JkTM
 0ZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794908710; x=1795513510;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=NEigU4jij5r91/pxWG3XKGaw/mSVdbAML+VHi2kgWDc=;
 b=ICh0TjVZdxCfnAf7yKKDcNBXYnAjHbKTe6zQ5hi7Shu6qnsXYHndUOrS6zurmBxEAs
 k7f0WdEVihr6nZ8T4CPAuSx0gUddc8pzVSK2TSS3A55BgLyHcSKvHFTHb4mtW0BYzJ6C
 XwHv+a0xMKz388CXhYFmDQOP0DrgMkbZFJE9uoD0ddl7SwJWB+Gbt8E1EiSigWSM+Xni
 SlJaB5L3wCKVJN3reHTmdR+iPZR95Q4P+Dc9A5lQbl+Gyo4yAA75Hgh4MrlOmHm/TGyo
 6xgtuKBa7BZCOz0t5jnbxYwohgezTbzVUVGEjBfHE+EtXzUe0ueoW8oRGLLXrJxe3mwM
 r9aQ==
X-Forwarded-Encrypted: i=1;
 AL+hErE6I8G5VI4mOeVdXu2DRTnuNvTlwVT+zJjmbSoDFyq+kSLT2FTT3fuWGiStbpQRehYL44Jx5ChTzORH@nongnu.org
X-Gm-Message-State: APuU4Z8b8xgvTnRjJDBNJ0oNNzAssxlz9ffoCSMTfeUDiqWtW6oE1nFb
 YTayjr0elDr9nS7dWmRgzsm8WxIOp4n+Lfn/PXtWP74cFUAo+KDBAgP4EXb3XvnjW+fCVB1NrSP
 eAJEiTIK6TGHDunodQaloZJygnMaxWf21E7I0QFRoSw5WyiF+ZZ2GYeDDMKPfKkOk80AITG6a0Q
 E1wWFT1EKlOxdganvwW4iZc2P5+2rmX746j28ocmclymo=
X-Gm-Gg: AYBFou0OOAsf4yrj9XbnyXnk1gcjsFFDWDcow+8Sgsy+fFB5F7nmQpgLRckVPvqh5ZZ
 nSDPob3NtzuFBear16c6rSGPbsu5y5o3Ue5OcyCCNa4ucYp3o1Yw2t18cGnNW6a1HBvma+ixFZt
 LB8jB/V6P8sxjCU6MAaZrJlf4tJdi0KAV8d25/jBt5pEIUUYPwMYGbquu2PU22ak4s5Gs/2Nq5R
 GSJuYCHiiJfteY4AHOXnFVOEoqSRkAKJMlg/TlnHwDwPwo+lcYRyyPsHwz0hBdnXt6TOCtYq7fI
 ckXqey7hA6djq6QR2/j6WtOcs3YTM3MX38tl6rb8YqYMWdhKDvrQ/ujJ5fOqs1h1js6LXxjJm37
 LFmK/lH5uOHFduY2cz3KZFhk+2GIFBZ3uqp9bbjwRuACoBlsx6bXLU2A8LGtZk9mVlGfeW59nnf
 VvH9kpth7Q/I1F2Sy3+BpS7Tw+vhDdP2V2qRlry4MWXjVXUryYG65/sWBROqYFU8xM4u6ZL6V8S
 c5FGhDm+dR7jeFfY0tPU0L1gcmYc0kOH41q/GyvuX3hdr/03AAFBPWfR2yJr29/0LJ1ZeR4suHY
 E2/eZa9MNnbeJiV/CsPkvAmWtJgEtKepKMUGXAoIOqlIPO8Mj914jiDQFO18pCliAD3rkCBPVB0
 98wvtfQAk2UV/
X-Received: by 2002:a17:907:802:b0:c4c:f85f:aa12 with SMTP id
 a640c23a62f3a-c509641566emr1106531666b.31.1794908710017; 
 Tue, 17 Nov 2026 01:45:10 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c5095b24608sm522314966b.30.2026.11.17.01.45.07
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 01:45:07 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6b65d69f5c2so6175753a12.3
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 01:45:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AL+hErENSBXNbzGKt3PdKiruytvmEegHnwiH0o0A3Z+NTicaXMPrH+mBm1KqsDkOLOtCp4S3yEV/PWGbwtFS@nongnu.org
X-Received: by 2002:a17:906:6d02:b0:c51:5f6:cf70 with SMTP id
 a640c23a62f3a-c5105f6d8d6mr19018066b.1.1794908707286; Tue, 17 Nov 2026
 01:45:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260825-upstream-ntrace_core-v1-0-f8be2f40d2fd@gmail.com>
 <20260825-upstream-ntrace_core-v1-10-f8be2f40d2fd@gmail.com>
In-Reply-To: <20260825-upstream-ntrace_core-v1-10-f8be2f40d2fd@gmail.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Tue, 17 Nov 2026 17:44:54 +0800
X-Gmail-Original-Message-ID: <CAMXXpfb=YccAe4QZFjqs_N-xLTQZam+sy+FQWq_UOVR+_Etp_A@mail.gmail.com>
X-Gm-Features: AclHuK-8EnK5n4Y2fqFsqp-PAyKrYGp4oG-iyJCcB_p578YG7nVdR4nHKW5Fskw
Message-ID: <CAMXXpfb=YccAe4QZFjqs_N-xLTQZam+sy+FQWq_UOVR+_Etp_A@mail.gmail.com>
Subject: Re: [PATCH 10/13] test/qtest/riscv-trace-test: add test-ntrace-simple
 qtest
To: Konstantin Semichastnov <antikostya2@gmail.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexei Filippov <halip0503@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e6f3ce066075bf4d"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=jay.chang@sifive.com; helo=mail-ej1-x634.google.com
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

--000000000000e6f3ce066075bf4d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Jay Chang<jay.chang@sifive.com>
Thanks

On Tue, Aug 25, 2026 at 10:49=E2=80=AFPM Konstantin Semichastnov <
antikostya2@gmail.com> wrote:

> Add a simple smoke test for the ntrace encoder/trace ram sink integration
> with the RISC-V 'virt' machine.
>
> Signed-off-by: Konstantin Semichastnov <antikostya2@gmail.com>
> ---
>  tests/qtest/riscv-trace-test.c | 59
> +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qtest/riscv-trace-test.c
> b/tests/qtest/riscv-trace-test.c
> index fe1cc85358..66069f7a56 100644
> --- a/tests/qtest/riscv-trace-test.c
> +++ b/tests/qtest/riscv-trace-test.c
> @@ -21,6 +21,7 @@ REG32(TR_TE_CONTROL, 0x0)
>      FIELD(TR_TE_CONTROL, ACTIVE, 0, 1)
>      FIELD(TR_TE_CONTROL, ENABLE, 1, 1)
>      FIELD(TR_TE_CONTROL, INST_TRACING, 2, 1)
> +    FIELD(TR_TE_CONTROL, FORMAT, 24, 3)
>
>  REG32(TR_RAM_START_LOW, 0x010)
>      FIELD(TR_RAM_START_LOW, ADDR, 0, 32)
> @@ -99,7 +100,61 @@ static void test_trace_simple(void)
>      g_assert(1 =3D=3D FIELD_EX32(reg, TR_TE_CONTROL, INST_TRACING));
>
>      g_test_timer_start();
> -    for (;;) {
> +    while (true) {
> +        reg_tram_writep =3D test_read_tram_writep(qts);
> +        if (reg_tram_writep > reg_tram_start) {
> +            break;
> +        }
> +
> +        g_assert(g_test_timer_elapsed() <=3D timeout_sec);
> +    }
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_ntrace_simple(void)
> +{
> +    QTestState *qts =3D qtest_init("-machine virt -accel tcg -d in_asm")=
;
> +    double timeout_sec =3D 0.5;
> +    uint64_t reg_tram_start, reg_tram_writep;
> +    uint32_t reg;
> +
> +    /* trTeActive :=3D 1 */
> +    reg =3D test_read_te_control(qts);
> +    reg =3D FIELD_DP32(reg, TR_TE_CONTROL, ACTIVE, 1);
> +    test_write_te_control(qts, reg);
> +    reg =3D test_read_te_control(qts);
> +    g_assert(1 =3D=3D FIELD_EX32(reg, TR_TE_CONTROL, ACTIVE));
> +
> +    /* trTeEnable :=3D 1 */
> +    reg =3D FIELD_DP32(reg, TR_TE_CONTROL, ENABLE, 1);
> +    test_write_te_control(qts, reg);
> +    reg =3D test_read_te_control(qts);
> +    g_assert(1 =3D=3D FIELD_EX32(reg, TR_TE_CONTROL, ENABLE));
> +
> +    /* trTeFormat :=3D 1 (ntrace) */
> +    reg =3D FIELD_DP32(reg, TR_TE_CONTROL, FORMAT, 1);
> +    test_write_te_control(qts, reg);
> +    reg =3D test_read_te_control(qts);
> +    g_assert(1 =3D=3D FIELD_EX32(reg, TR_TE_CONTROL, FORMAT));
> +
> +    /*
> +     * Verify if RAM Sink write pointer is equal to
> +     * ramstart before start tracing.
> +     */
> +    reg_tram_start =3D test_read_tram_ramstart(qts);
> +    g_assert(reg_tram_start > 0);
> +    reg_tram_writep =3D test_read_tram_writep(qts);
> +    g_assert(reg_tram_writep =3D=3D reg_tram_start);
> +
> +    /* trTeInstTracing :=3D 1 */
> +    reg =3D FIELD_DP32(reg, TR_TE_CONTROL, INST_TRACING, 1);
> +    test_write_te_control(qts, reg);
> +    reg =3D test_read_te_control(qts);
> +    g_assert(1 =3D=3D FIELD_EX32(reg, TR_TE_CONTROL, INST_TRACING));
> +
> +    g_test_timer_start();
> +    while (true) {
>          reg_tram_writep =3D test_read_tram_writep(qts);
>          if (reg_tram_writep > reg_tram_start) {
>              break;
> @@ -116,5 +171,7 @@ int main(int argc, char *argv[])
>      g_test_init(&argc, &argv, NULL);
>      qtest_add_func("/riscv-trace-test/test-trace-simple",
>                     test_trace_simple);
> +    qtest_add_func("/riscv-trace-test/test-ntrace-simple",
> +                   test_ntrace_simple);
>      return g_test_run();
>  }
>
> --
> 2.43.0
>
>
>

--000000000000e6f3ce066075bf4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Jay Chang&lt;<a href=3D"mailto:jay.chang@sifi=
ve.com" target=3D"_blank">jay.chang@sifive.com</a>&gt;<div>Thanks</div></di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Aug 25, 2026 at 10:49=E2=80=AFPM Konstantin Semic=
hastnov &lt;<a href=3D"mailto:antikostya2@gmail.com">antikostya2@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">A=
dd a simple smoke test for the ntrace encoder/trace ram sink integration<br=
>
with the RISC-V &#39;virt&#39; machine.<br>
<br>
Signed-off-by: Konstantin Semichastnov &lt;<a href=3D"mailto:antikostya2@gm=
ail.com" target=3D"_blank">antikostya2@gmail.com</a>&gt;<br>
---<br>
=C2=A0tests/qtest/riscv-trace-test.c | 59 +++++++++++++++++++++++++++++++++=
++++++++-<br>
=C2=A01 file changed, 58 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/tests/qtest/riscv-trace-test.c b/tests/qtest/riscv-trace-test.=
c<br>
index fe1cc85358..66069f7a56 100644<br>
--- a/tests/qtest/riscv-trace-test.c<br>
+++ b/tests/qtest/riscv-trace-test.c<br>
@@ -21,6 +21,7 @@ REG32(TR_TE_CONTROL, 0x0)<br>
=C2=A0 =C2=A0 =C2=A0FIELD(TR_TE_CONTROL, ACTIVE, 0, 1)<br>
=C2=A0 =C2=A0 =C2=A0FIELD(TR_TE_CONTROL, ENABLE, 1, 1)<br>
=C2=A0 =C2=A0 =C2=A0FIELD(TR_TE_CONTROL, INST_TRACING, 2, 1)<br>
+=C2=A0 =C2=A0 FIELD(TR_TE_CONTROL, FORMAT, 24, 3)<br>
<br>
=C2=A0REG32(TR_RAM_START_LOW, 0x010)<br>
=C2=A0 =C2=A0 =C2=A0FIELD(TR_RAM_START_LOW, ADDR, 0, 32)<br>
@@ -99,7 +100,61 @@ static void test_trace_simple(void)<br>
=C2=A0 =C2=A0 =C2=A0g_assert(1 =3D=3D FIELD_EX32(reg, TR_TE_CONTROL, INST_T=
RACING));<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_test_timer_start();<br>
-=C2=A0 =C2=A0 for (;;) {<br>
+=C2=A0 =C2=A0 while (true) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_tram_writep =3D test_read_tram_writep(qts)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (reg_tram_writep &gt; reg_tram_start) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(g_test_timer_elapsed() &lt;=3D timeou=
t_sec);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qtest_quit(qts);<br>
+}<br>
+<br>
+static void test_ntrace_simple(void)<br>
+{<br>
+=C2=A0 =C2=A0 QTestState *qts =3D qtest_init(&quot;-machine virt -accel tc=
g -d in_asm&quot;);<br>
+=C2=A0 =C2=A0 double timeout_sec =3D 0.5;<br>
+=C2=A0 =C2=A0 uint64_t reg_tram_start, reg_tram_writep;<br>
+=C2=A0 =C2=A0 uint32_t reg;<br>
+<br>
+=C2=A0 =C2=A0 /* trTeActive :=3D 1 */<br>
+=C2=A0 =C2=A0 reg =3D test_read_te_control(qts);<br>
+=C2=A0 =C2=A0 reg =3D FIELD_DP32(reg, TR_TE_CONTROL, ACTIVE, 1);<br>
+=C2=A0 =C2=A0 test_write_te_control(qts, reg);<br>
+=C2=A0 =C2=A0 reg =3D test_read_te_control(qts);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D FIELD_EX32(reg, TR_TE_CONTROL, ACTIVE));<b=
r>
+<br>
+=C2=A0 =C2=A0 /* trTeEnable :=3D 1 */<br>
+=C2=A0 =C2=A0 reg =3D FIELD_DP32(reg, TR_TE_CONTROL, ENABLE, 1);<br>
+=C2=A0 =C2=A0 test_write_te_control(qts, reg);<br>
+=C2=A0 =C2=A0 reg =3D test_read_te_control(qts);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D FIELD_EX32(reg, TR_TE_CONTROL, ENABLE));<b=
r>
+<br>
+=C2=A0 =C2=A0 /* trTeFormat :=3D 1 (ntrace) */<br>
+=C2=A0 =C2=A0 reg =3D FIELD_DP32(reg, TR_TE_CONTROL, FORMAT, 1);<br>
+=C2=A0 =C2=A0 test_write_te_control(qts, reg);<br>
+=C2=A0 =C2=A0 reg =3D test_read_te_control(qts);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D FIELD_EX32(reg, TR_TE_CONTROL, FORMAT));<b=
r>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Verify if RAM Sink write pointer is equal to<br>
+=C2=A0 =C2=A0 =C2=A0* ramstart before start tracing.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 reg_tram_start =3D test_read_tram_ramstart(qts);<br>
+=C2=A0 =C2=A0 g_assert(reg_tram_start &gt; 0);<br>
+=C2=A0 =C2=A0 reg_tram_writep =3D test_read_tram_writep(qts);<br>
+=C2=A0 =C2=A0 g_assert(reg_tram_writep =3D=3D reg_tram_start);<br>
+<br>
+=C2=A0 =C2=A0 /* trTeInstTracing :=3D 1 */<br>
+=C2=A0 =C2=A0 reg =3D FIELD_DP32(reg, TR_TE_CONTROL, INST_TRACING, 1);<br>
+=C2=A0 =C2=A0 test_write_te_control(qts, reg);<br>
+=C2=A0 =C2=A0 reg =3D test_read_te_control(qts);<br>
+=C2=A0 =C2=A0 g_assert(1 =3D=3D FIELD_EX32(reg, TR_TE_CONTROL, INST_TRACIN=
G));<br>
+<br>
+=C2=A0 =C2=A0 g_test_timer_start();<br>
+=C2=A0 =C2=A0 while (true) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_tram_writep =3D test_read_tram_writep=
(qts);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg_tram_writep &gt; reg_tram_start) =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -116,5 +171,7 @@ int main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0g_test_init(&amp;argc, &amp;argv, NULL);<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;/riscv-trace-test/test-trace-simpl=
e&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_=
trace_simple);<br>
+=C2=A0 =C2=A0 qtest_add_func(&quot;/riscv-trace-test/test-ntrace-simple&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_=
ntrace_simple);<br>
=C2=A0 =C2=A0 =C2=A0return g_test_run();<br>
=C2=A0}<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
</blockquote></div>

--000000000000e6f3ce066075bf4d--

