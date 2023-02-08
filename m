Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPdyW-0001OT-S5
	for mharc-qemu-riscv@gnu.org; Wed, 08 Feb 2023 01:30:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pPdyS-0001Nn-9s
 for qemu-riscv@nongnu.org; Wed, 08 Feb 2023 01:30:32 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pPdyQ-0003T4-H0
 for qemu-riscv@nongnu.org; Wed, 08 Feb 2023 01:30:32 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-16a8d511ce0so3510357fac.1
 for <qemu-riscv@nongnu.org>; Tue, 07 Feb 2023 22:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P9HmUPUbUwhMNhNgyAsaaHGlm+AuT1fH/lkFxS7uWSQ=;
 b=JAC13ojhcZUdKtIdbyoLADN2fw0w0o+BuEJDyUFyaB34g5ePt25q2BPWEwmqJvHpk9
 cLghYnaknPKQZF29i1W3uIwMnlsiW7YjjBunirte+ZTJJZ+j4n1WlNLKWxJEQvsm2liz
 AuE1ixTy6LKTEbQPZwpq30jTuycaNMpI70ssEBaIXsKACnn+jKk4rxybpdNAPN2nVpRc
 y1HtFRaDLcn2yyiJD8wCMqLuZzIEbykA6zCsX6ZMz/3ADdDFwdCmJE2mA7TV/Hb1yOuZ
 y9d/LGMQsexwI01M0yJcWnDZ85T/2Dk+SiXxUMI3iaCwjea0nCSr0n40zTJ6cpqjb7OX
 Eu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P9HmUPUbUwhMNhNgyAsaaHGlm+AuT1fH/lkFxS7uWSQ=;
 b=4Zl0UHgBxrp6TE8v73rNl191YlgOo7x4TMTthsaxCsD5iVP1IyYQ0GlJ5M++maxkJ0
 gDOR0eGwqRRd/lZWbbXSI/595s+keWuBrpYD3ocv88uhqL740wYo6p2WnyTi2Tu7WLSu
 rse/2Wl8FXTIe0VSqriLynZfcllbdSPjsqCgCYQPup1OorsiwTxZGZ+7dpF5Jm2xT3Mc
 7Y0IdX61TBTo3GY8gZ9o7gmkNno83fX2W1Ptf1IXUqZxoQNppNAmYFG9rx2FmdefcT+Y
 27Rlzeq2g33uZNMPA5RYH3Q2Hqm2PRQwj2g7CQeEWcRLnyvhSrwhVvdr3cGUNsB0+VLK
 Zv1Q==
X-Gm-Message-State: AO0yUKWz6VcevqKLTKRwSM55NbNuYG/KhufiNrKxgyo7gsMH30KCT+pd
 AdmLuoBhFnM/y7zJRIE+aqeYzn9dJRDgNNRy3dcAtg==
X-Google-Smtp-Source: AK7set8BK7C6mOos/I5DOzcWONGEExKcWHsOYYH6evsLR8vu4VmIJcBkNo3HkPqM/7T92Wxv0lecq1kXXlNWyDqFL58=
X-Received: by 2002:a05:6870:c68a:b0:16a:4376:e95f with SMTP id
 cv10-20020a056870c68a00b0016a4376e95fmr171941oab.165.1675837829003; Tue, 07
 Feb 2023 22:30:29 -0800 (PST)
MIME-Version: 1.0
References: <20230207084341.303907-1-frank.chang@sifive.com>
In-Reply-To: <20230207084341.303907-1-frank.chang@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 8 Feb 2023 14:30:18 +0800
Message-ID: <CAE_xrPiwiPcmcTQ+nBEL8CVp3OQkup2t5hq53iCeustvueyG-g@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Remove .min_priv_ver restriction from RVV
 CSRs
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000007fd14f05f42a66bc"
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=frank.chang@sifive.com; helo=mail-oa1-x34.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Feb 2023 06:30:32 -0000

--0000000000007fd14f05f42a66bc
Content-Type: text/plain; charset="UTF-8"

I realized that I should also remove the privileged version check
in isa_edata_arr[], too.
I will send out v2 patch to fix it.

Regards,
Frank Chang

On Tue, Feb 7, 2023 at 4:43 PM <frank.chang@sifive.com> wrote:

> From: Frank Chang <frank.chang@sifive.com>
>
> The RVV specification does not require that the core needs to support
> the privileged specification v1.12.0 to support RVV, and there is no
> dependency from ISA level. This commit removes the restriction.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/csr.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fa17d7770c4..1b0a0c1693c 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3980,20 +3980,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_FRM]      = { "frm",      fs,     read_frm,     write_frm    },
>      [CSR_FCSR]     = { "fcsr",     fs,     read_fcsr,    write_fcsr   },
>      /* Vector CSRs */
> -    [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart,
> -                       .min_priv_ver = PRIV_VERSION_1_12_0            },
> -    [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat,
> -                       .min_priv_ver = PRIV_VERSION_1_12_0            },
> -    [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm,
> -                       .min_priv_ver = PRIV_VERSION_1_12_0            },
> -    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr,
> -                       .min_priv_ver = PRIV_VERSION_1_12_0            },
> -    [CSR_VL]       = { "vl",       vs,     read_vl,
> -                       .min_priv_ver = PRIV_VERSION_1_12_0            },
> -    [CSR_VTYPE]    = { "vtype",    vs,     read_vtype,
> -                       .min_priv_ver = PRIV_VERSION_1_12_0            },
> -    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb,
> -                       .min_priv_ver = PRIV_VERSION_1_12_0            },
> +    [CSR_VSTART]   = { "vstart",   vs,     read_vstart,  write_vstart },
> +    [CSR_VXSAT]    = { "vxsat",    vs,     read_vxsat,   write_vxsat  },
> +    [CSR_VXRM]     = { "vxrm",     vs,     read_vxrm,    write_vxrm   },
> +    [CSR_VCSR]     = { "vcsr",     vs,     read_vcsr,    write_vcsr   },
> +    [CSR_VL]       = { "vl",       vs,     read_vl                    },
> +    [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
> +    [CSR_VLENB]    = { "vlenb",    vs,     read_vlenb                 },
>      /* User Timers and Counters */
>      [CSR_CYCLE]    = { "cycle",    ctr,    read_hpmcounter  },
>      [CSR_INSTRET]  = { "instret",  ctr,    read_hpmcounter  },
> --
> 2.25.1
>
>

--0000000000007fd14f05f42a66bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SSByZWFsaXplZCB0aGF0IEkgc2hvdWxkIGFsc28gcmVtb3ZlIHRoZSBw
cml2aWxlZ2VkIHZlcnNpb24gY2hlY2sgaW7CoGlzYV9lZGF0YV9hcnJbXSwgdG9vLjxkaXY+SSB3
aWxsIHNlbmQgb3V0IHYyIHBhdGNoIHRvIGZpeCBpdC48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PlJlZ2FyZHMsPC9kaXY+PGRpdj5GcmFuayBDaGFuZzwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNz
PSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFR1ZSwg
RmViIDcsIDIwMjMgYXQgNDo0MyBQTSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmZyYW5rLmNoYW5nQHNp
Zml2ZS5jb20iPmZyYW5rLmNoYW5nQHNpZml2ZS5jb208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4
IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiPkZyb206IEZyYW5rIENoYW5nICZsdDs8YSBocmVmPSJtYWlsdG86ZnJhbmsuY2hhbmdA
c2lmaXZlLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmZyYW5rLmNoYW5nQHNpZml2ZS5jb208L2E+Jmd0
Ozxicj4NCjxicj4NClRoZSBSVlYgc3BlY2lmaWNhdGlvbiBkb2VzIG5vdCByZXF1aXJlIHRoYXQg
dGhlIGNvcmUgbmVlZHMgdG8gc3VwcG9ydDxicj4NCnRoZSBwcml2aWxlZ2VkIHNwZWNpZmljYXRp
b24gdjEuMTIuMCB0byBzdXBwb3J0IFJWViwgYW5kIHRoZXJlIGlzIG5vPGJyPg0KZGVwZW5kZW5j
eSBmcm9tIElTQSBsZXZlbC4gVGhpcyBjb21taXQgcmVtb3ZlcyB0aGUgcmVzdHJpY3Rpb24uPGJy
Pg0KPGJyPg0KU2lnbmVkLW9mZi1ieTogRnJhbmsgQ2hhbmcgJmx0OzxhIGhyZWY9Im1haWx0bzpm
cmFuay5jaGFuZ0BzaWZpdmUuY29tIiB0YXJnZXQ9Il9ibGFuayI+ZnJhbmsuY2hhbmdAc2lmaXZl
LmNvbTwvYT4mZ3Q7PGJyPg0KLS0tPGJyPg0KwqB0YXJnZXQvcmlzY3YvY3NyLmMgfCAyMSArKysr
KysrLS0tLS0tLS0tLS0tLS08YnI+DQrCoDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDE0IGRlbGV0aW9ucygtKTxicj4NCjxicj4NCmRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3YvY3Ny
LmMgYi90YXJnZXQvcmlzY3YvY3NyLmM8YnI+DQppbmRleCBmYTE3ZDc3NzBjNC4uMWIwYTBjMTY5
M2MgMTAwNjQ0PGJyPg0KLS0tIGEvdGFyZ2V0L3Jpc2N2L2Nzci5jPGJyPg0KKysrIGIvdGFyZ2V0
L3Jpc2N2L2Nzci5jPGJyPg0KQEAgLTM5ODAsMjAgKzM5ODAsMTMgQEAgcmlzY3ZfY3NyX29wZXJh
dGlvbnMgY3NyX29wc1tDU1JfVEFCTEVfU0laRV0gPSB7PGJyPg0KwqAgwqAgwqBbQ1NSX0ZSTV3C
oCDCoCDCoCA9IHsgJnF1b3Q7ZnJtJnF1b3Q7LMKgIMKgIMKgIGZzLMKgIMKgIMKgcmVhZF9mcm0s
wqAgwqAgwqB3cml0ZV9mcm3CoCDCoCB9LDxicj4NCsKgIMKgIMKgW0NTUl9GQ1NSXcKgIMKgIMKg
PSB7ICZxdW90O2Zjc3ImcXVvdDsswqAgwqAgwqBmcyzCoCDCoCDCoHJlYWRfZmNzcizCoCDCoCB3
cml0ZV9mY3NywqAgwqB9LDxicj4NCsKgIMKgIMKgLyogVmVjdG9yIENTUnMgKi88YnI+DQotwqAg
wqAgW0NTUl9WU1RBUlRdwqAgwqA9IHsgJnF1b3Q7dnN0YXJ0JnF1b3Q7LMKgIMKgdnMswqAgwqAg
wqByZWFkX3ZzdGFydCzCoCB3cml0ZV92c3RhcnQsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzDCoCDCoCDC
oCDCoCDCoCDCoCB9LDxicj4NCi3CoCDCoCBbQ1NSX1ZYU0FUXcKgIMKgID0geyAmcXVvdDt2eHNh
dCZxdW90OyzCoCDCoCB2cyzCoCDCoCDCoHJlYWRfdnhzYXQswqAgwqB3cml0ZV92eHNhdCw8YnI+
DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAubWluX3ByaXZfdmVyID0gUFJJ
Vl9WRVJTSU9OXzFfMTJfMMKgIMKgIMKgIMKgIMKgIMKgIH0sPGJyPg0KLcKgIMKgIFtDU1JfVlhS
TV3CoCDCoCDCoD0geyAmcXVvdDt2eHJtJnF1b3Q7LMKgIMKgIMKgdnMswqAgwqAgwqByZWFkX3Z4
cm0swqAgwqAgd3JpdGVfdnhybSw8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAubWluX3ByaXZfdmVyID0gUFJJVl9WRVJTSU9OXzFfMTJfMMKgIMKgIMKgIMKgIMKgIMKg
IH0sPGJyPg0KLcKgIMKgIFtDU1JfVkNTUl3CoCDCoCDCoD0geyAmcXVvdDt2Y3NyJnF1b3Q7LMKg
IMKgIMKgdnMswqAgwqAgwqByZWFkX3Zjc3IswqAgwqAgd3JpdGVfdmNzciw8YnI+DQotwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAubWluX3ByaXZfdmVyID0gUFJJVl9WRVJTSU9O
XzFfMTJfMMKgIMKgIMKgIMKgIMKgIMKgIH0sPGJyPg0KLcKgIMKgIFtDU1JfVkxdwqAgwqAgwqAg
wqA9IHsgJnF1b3Q7dmwmcXVvdDsswqAgwqAgwqAgwqB2cyzCoCDCoCDCoHJlYWRfdmwsPGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9IFBSSVZf
VkVSU0lPTl8xXzEyXzDCoCDCoCDCoCDCoCDCoCDCoCB9LDxicj4NCi3CoCDCoCBbQ1NSX1ZUWVBF
XcKgIMKgID0geyAmcXVvdDt2dHlwZSZxdW90OyzCoCDCoCB2cyzCoCDCoCDCoHJlYWRfdnR5cGUs
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2X3ZlciA9
IFBSSVZfVkVSU0lPTl8xXzEyXzDCoCDCoCDCoCDCoCDCoCDCoCB9LDxicj4NCi3CoCDCoCBbQ1NS
X1ZMRU5CXcKgIMKgID0geyAmcXVvdDt2bGVuYiZxdW90OyzCoCDCoCB2cyzCoCDCoCDCoHJlYWRf
dmxlbmIsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1pbl9wcml2
X3ZlciA9IFBSSVZfVkVSU0lPTl8xXzEyXzDCoCDCoCDCoCDCoCDCoCDCoCB9LDxicj4NCivCoCDC
oCBbQ1NSX1ZTVEFSVF3CoCDCoD0geyAmcXVvdDt2c3RhcnQmcXVvdDsswqAgwqB2cyzCoCDCoCDC
oHJlYWRfdnN0YXJ0LMKgIHdyaXRlX3ZzdGFydCB9LDxicj4NCivCoCDCoCBbQ1NSX1ZYU0FUXcKg
IMKgID0geyAmcXVvdDt2eHNhdCZxdW90OyzCoCDCoCB2cyzCoCDCoCDCoHJlYWRfdnhzYXQswqAg
wqB3cml0ZV92eHNhdMKgIH0sPGJyPg0KK8KgIMKgIFtDU1JfVlhSTV3CoCDCoCDCoD0geyAmcXVv
dDt2eHJtJnF1b3Q7LMKgIMKgIMKgdnMswqAgwqAgwqByZWFkX3Z4cm0swqAgwqAgd3JpdGVfdnhy
bcKgIMKgfSw8YnI+DQorwqAgwqAgW0NTUl9WQ1NSXcKgIMKgIMKgPSB7ICZxdW90O3Zjc3ImcXVv
dDsswqAgwqAgwqB2cyzCoCDCoCDCoHJlYWRfdmNzcizCoCDCoCB3cml0ZV92Y3NywqAgwqB9LDxi
cj4NCivCoCDCoCBbQ1NSX1ZMXcKgIMKgIMKgIMKgPSB7ICZxdW90O3ZsJnF1b3Q7LMKgIMKgIMKg
IMKgdnMswqAgwqAgwqByZWFkX3ZswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfSw8YnI+
DQorwqAgwqAgW0NTUl9WVFlQRV3CoCDCoCA9IHsgJnF1b3Q7dnR5cGUmcXVvdDsswqAgwqAgdnMs
wqAgwqAgwqByZWFkX3Z0eXBlwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9LDxicj4NCivCoCDC
oCBbQ1NSX1ZMRU5CXcKgIMKgID0geyAmcXVvdDt2bGVuYiZxdW90OyzCoCDCoCB2cyzCoCDCoCDC
oHJlYWRfdmxlbmLCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0sPGJyPg0KwqAgwqAgwqAvKiBV
c2VyIFRpbWVycyBhbmQgQ291bnRlcnMgKi88YnI+DQrCoCDCoCDCoFtDU1JfQ1lDTEVdwqAgwqAg
PSB7ICZxdW90O2N5Y2xlJnF1b3Q7LMKgIMKgIGN0cizCoCDCoCByZWFkX2hwbWNvdW50ZXLCoCB9
LDxicj4NCsKgIMKgIMKgW0NTUl9JTlNUUkVUXcKgID0geyAmcXVvdDtpbnN0cmV0JnF1b3Q7LMKg
IGN0cizCoCDCoCByZWFkX2hwbWNvdW50ZXLCoCB9LDxicj4NCi0tIDxicj4NCjIuMjUuMTxicj4N
Cjxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj4NCg==
--0000000000007fd14f05f42a66bc--

