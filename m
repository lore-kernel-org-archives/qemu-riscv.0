Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nDJfk-0000cm-Va
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jan 2022 00:19:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nDJfi-0000c5-Bc; Fri, 28 Jan 2022 00:19:42 -0500
Received: from [2607:f8b0:4864:20::131] (port=33698
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nDJfg-00062d-SK; Fri, 28 Jan 2022 00:19:42 -0500
Received: by mail-il1-x131.google.com with SMTP id o10so4518321ilh.0;
 Thu, 27 Jan 2022 21:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SOOgEYSsLgEfw5SG+e/mUHAbkLbUkoeyExLU84eIH4g=;
 b=aklocPVrgAF2ZNIgmGW+XGGPdEZslnrvM7fHvfXDhdh6EOU6lbyKCDN6eAxyBIpsGI
 TdWvXBQKVeyzV4Rr1dHn46BXzSBNn/EWPyN8Ka42TkkrUtO3QJpzheoUqT0Knkxnmo0E
 UigrAlndipv60i02csGTTyEy7OrdCWyrSXVj3Rj6VVArJYemOeLt4kX+jGDwnadjzHYl
 4ZdoLotzqfrqeU6u2tjP1LoOaSwnOV3P5heXHMcEbjTYkPaONujmEFaApAd01mGNXvPI
 w8T4BqZDMLAuzcoYXllgssgfx5OZPmSW9yziemST69DtC6WvSI3iycxQMRD5NfmNWlj3
 Y96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SOOgEYSsLgEfw5SG+e/mUHAbkLbUkoeyExLU84eIH4g=;
 b=KVcBBoFjN8zH2hvzTD8/OCPIZsfMbdyCZbmIttAtjTboFGvy33Wo/y7BHnXEGkVRql
 3Wcgt0xEqO7fIs5Pf13TGsPfa03f87Sw24SfEdx78jwSJpByeneh8LNdtlnZgwbEZGVx
 ynsUorXKbURhFTlRZIgPtYUXIlx0qPqsuvb09QaEJbfHLSjFpoJ9G9DHCrZwrpVRIOHW
 gb/oHAbx9dezyd9OOAf4NCCaocXyJKjn67sCkc1lfV3q7fjRkz/2OjvT5lb6gs0JKXMR
 SLWO9OTAouOU1QsJ8n94dYpVycBK3KXrtK4+X4563NhlpVh3I3Q3/P0GIPGnB2JJS/bU
 0xwg==
X-Gm-Message-State: AOAM531LgsmCrL1DL8sr5Z6Rvzl2ia9X98coidZDB7e8SDMxanWajpyP
 YlzLaFidaNS29RM/IF4mfc9JZuQAyQs8wFo2mCw=
X-Google-Smtp-Source: ABdhPJya88M1qJPjYj3TnihVzONosiLIVz8MIuEf//WuPfsSYwOyn3zz+0tD2Cy7AYmn0igsFWQH8paPyyES1drNJKk=
X-Received: by 2002:a92:680b:: with SMTP id d11mr4673031ilc.74.1643347179499; 
 Thu, 27 Jan 2022 21:19:39 -0800 (PST)
MIME-Version: 1.0
References: <20220124074940.363064-1-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20220124074940.363064-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jan 2022 15:19:13 +1000
Message-ID: <CAKmqyKO19vdmU64vSAyCQZgdFF+DmROwk02UUTkMyXasvdB4oA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: correct "code should not be reached" for
 x-rv128
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Fri, 28 Jan 2022 05:19:42 -0000

On Mon, Jan 24, 2022 at 5:54 PM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> The addition of uxl support in gdbstub adds a few checks on the maximum
> register length, but omitted MXL_RV128, leading to the occurence of
> "code should not be reached" in a few places.
> This patch makes rv128 react as rv64 for gdb, as previously.
>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/gdbstub.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index f531a74c2f..9ed049c29e 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -64,6 +64,7 @@ int riscv_cpu_gdb_read_register(CPUState *cs, GByteArra=
y *mem_buf, int n)
>      case MXL_RV32:
>          return gdb_get_reg32(mem_buf, tmp);
>      case MXL_RV64:
> +    case MXL_RV128:
>          return gdb_get_reg64(mem_buf, tmp);
>      default:
>          g_assert_not_reached();
> @@ -84,6 +85,7 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t =
*mem_buf, int n)
>          length =3D 4;
>          break;
>      case MXL_RV64:
> +    case MXL_RV128:
>          if (env->xl < MXL_RV64) {
>              tmp =3D (int32_t)ldq_p(mem_buf);
>          } else {
> @@ -420,6 +422,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUStat=
e *cs)
>                                   1, "riscv-32bit-virtual.xml", 0);
>          break;
>      case MXL_RV64:
> +    case MXL_RV128:
>          gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
>                                   riscv_gdb_set_virtual,
>                                   1, "riscv-64bit-virtual.xml", 0);
> --
> 2.34.1
>
>

