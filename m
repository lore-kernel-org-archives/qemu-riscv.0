Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB7AC7EE25
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:27:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8YDH-0006ut-7f; Sun, 11 Jun 2023 23:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YDF-0006u9-B3; Sun, 11 Jun 2023 23:27:25 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YDD-0006LQ-CC; Sun, 11 Jun 2023 23:27:25 -0400
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-464f8a20c05so993012e0c.1; 
 Sun, 11 Jun 2023 20:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686540440; x=1689132440;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XA8xu2prwVDWG9L4bCfzFFqeQ8CTmeHUFZdcD65xr3Y=;
 b=dK7Mx39IAu8TMwdhKKY0pHJ4/n/HWGT2a6SKMW7TC8Mx7QRLrKigtlInHnL9oBBKbs
 aqjf3SNM+MaR80bBb21QssezwUuGtJnuxgvsIsMPRxmqa5MbvJ/4ppWOuBMxRudM9SHn
 0428qbwteBjRf4jPi0/k0ECV+snP4HzMaNgruWuoeAV7FPw8EQhFfvKLVG8LBIKvtmd+
 Bhmqyg8oapfjBL6s+g4zlRCnaerTN5RlnGayhvNgFJcO4haWSv5MXzEYPnUcQqbC7Alk
 X3xLCnAL3uY1qv6k9SfGXeyfYENVYAsRh+vgENrEBvHUQ4NSpTlatHK+SSY+8h5KgIOO
 1F/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686540440; x=1689132440;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XA8xu2prwVDWG9L4bCfzFFqeQ8CTmeHUFZdcD65xr3Y=;
 b=cHQFkakXcFTt3L4EE+dI6nJpMeko8M+7PxQskLhUTHpZaFt0dr3l4LiSw688lFqcCv
 lhEEZ2MimP8I03rJCf1qNy/OjNL0CLVlu5OMXPg9EZuLltsx7YTDKbb09bJ58pP6/tfh
 QJNM3fl7M92zS1L2lVrT5est1lbgUXOfMXFmFcc01mDsjYae5ql0dKUDCyBRY+1go4G8
 uKZqFBmgCcAyvoQav6pBOrK12Uo4M3uwMwr1N63IHv6DhtVgnVZ2wej9ojT64+m+ELNM
 4YO6yt7sgKLDFauIj7lfGQSYNffmD7YqBCxwlnt26RUnebKk0jWOM4JFVjw57fg1I0RX
 inmA==
X-Gm-Message-State: AC+VfDw3E6nzWkBlaIAZF78FndlhP0fyp97jA8rdXWdoBQE0lvjtqmF0
 A66hZqynXgEgp77XazcTz8mwjpy6NR1DECc3iYo=
X-Google-Smtp-Source: ACHHUZ6zeDlwCOclsuYyxRLJDjxTW8aYIlj8aCVTGnJ0HH+W1FaEPr9I7GU3E98nb0dII3W72MUTbsod3u7xpLeLLPU=
X-Received: by 2002:a1f:bd02:0:b0:461:7093:b452 with SMTP id
 n2-20020a1fbd02000000b004617093b452mr2547674vkf.16.1686540440512; Sun, 11 Jun
 2023 20:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
 <20230530131843.1186637-6-christoph.muellner@vrull.eu>
In-Reply-To: <20230530131843.1186637-6-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 13:26:54 +1000
Message-ID: <CAKmqyKNsaFMZuj5gWw2aqiRk5=Ue3ctAEnxyAzVQD4soE5xwmg@mail.gmail.com>
Subject: Re: [PATCH 5/9] disas/riscv: Encapsulate opcode_data into decode
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, May 30, 2023 at 11:23=E2=80=AFPM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> This patch adds a reference to a struct rv_opcode_data object
> into struct rv_decode. This further allows to remove all references
> to the global variable opcode_data (which is renamed to rvi_opcode_data).
>
> This patch does not introduce any functional change, but prepares
> the code for more struct rv_opcode_data objects in the future.
>
> This patch is based on previous work from Liu Zhiwei:
>   https://lists.nongnu.org/archive/html/qemu-devel/2022-08/msg03662.html
>
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c |  9 ++++++++-
>  disas/riscv.h | 33 +++++++++++++++++----------------
>  2 files changed, 25 insertions(+), 17 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 4cf477bc02..086edee6a2 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -1055,7 +1055,7 @@ static const rv_comp_data rvcp_fsgnjx_q[] =3D {
>
>  /* instruction metadata */
>
> -const rv_opcode_data opcode_data[] =3D {
> +const rv_opcode_data rvi_opcode_data[] =3D {
>      { "illegal", rv_codec_illegal, rv_fmt_none, NULL, 0, 0, 0 },
>      { "lui", rv_codec_u, rv_fmt_rd_imm, NULL, 0, 0, 0 },
>      { "auipc", rv_codec_u, rv_fmt_rd_offset, NULL, 0, 0, 0 },
> @@ -3803,6 +3803,7 @@ static uint32_t operand_tbl_index(rv_inst inst)
>
>  static void decode_inst_operands(rv_decode *dec, rv_isa isa)
>  {
> +    const rv_opcode_data *opcode_data =3D dec->opcode_data;
>      rv_inst inst =3D dec->inst;
>      dec->codec =3D opcode_data[dec->op].codec;
>      switch (dec->codec) {
> @@ -4284,6 +4285,7 @@ static void append(char *s1, const char *s2, size_t=
 n)
>
>  static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode =
*dec)
>  {
> +    const rv_opcode_data *opcode_data =3D dec->opcode_data;
>      char tmp[64];
>      const char *fmt;
>
> @@ -4517,6 +4519,7 @@ static void format_inst(char *buf, size_t buflen, s=
ize_t tab, rv_decode *dec)
>
>  static void decode_inst_lift_pseudo(rv_decode *dec)
>  {
> +    const rv_opcode_data *opcode_data =3D dec->opcode_data;
>      const rv_comp_data *comp_data =3D opcode_data[dec->op].pseudo;
>      if (!comp_data) {
>          return;
> @@ -4535,6 +4538,7 @@ static void decode_inst_lift_pseudo(rv_decode *dec)
>
>  static void decode_inst_decompress_rv32(rv_decode *dec)
>  {
> +    const rv_opcode_data *opcode_data =3D dec->opcode_data;
>      int decomp_op =3D opcode_data[dec->op].decomp_rv32;
>      if (decomp_op !=3D rv_op_illegal) {
>          if ((opcode_data[dec->op].decomp_data & rvcd_imm_nz)
> @@ -4549,6 +4553,7 @@ static void decode_inst_decompress_rv32(rv_decode *=
dec)
>
>  static void decode_inst_decompress_rv64(rv_decode *dec)
>  {
> +    const rv_opcode_data *opcode_data =3D dec->opcode_data;
>      int decomp_op =3D opcode_data[dec->op].decomp_rv64;
>      if (decomp_op !=3D rv_op_illegal) {
>          if ((opcode_data[dec->op].decomp_data & rvcd_imm_nz)
> @@ -4563,6 +4568,7 @@ static void decode_inst_decompress_rv64(rv_decode *=
dec)
>
>  static void decode_inst_decompress_rv128(rv_decode *dec)
>  {
> +    const rv_opcode_data *opcode_data =3D dec->opcode_data;
>      int decomp_op =3D opcode_data[dec->op].decomp_rv128;
>      if (decomp_op !=3D rv_op_illegal) {
>          if ((opcode_data[dec->op].decomp_data & rvcd_imm_nz)
> @@ -4598,6 +4604,7 @@ disasm_inst(char *buf, size_t buflen, rv_isa isa, u=
int64_t pc, rv_inst inst)
>      rv_decode dec =3D { 0 };
>      dec.pc =3D pc;
>      dec.inst =3D inst;
> +    dec.opcode_data =3D rvi_opcode_data;
>      decode_inst_opcode(&dec, isa);
>      decode_inst_operands(&dec, isa);
>      decode_inst_decompress(&dec, isa);
> diff --git a/disas/riscv.h b/disas/riscv.h
> index de2623e3cc..188f03feeb 100644
> --- a/disas/riscv.h
> +++ b/disas/riscv.h
> @@ -162,9 +162,26 @@ typedef enum {
>
>  /* structures */
>
> +typedef struct {
> +    const int op;
> +    const rvc_constraint *constraints;
> +} rv_comp_data;
> +
> +typedef struct {
> +    const char * const name;
> +    const rv_codec codec;
> +    const char * const format;
> +    const rv_comp_data *pseudo;
> +    const short decomp_rv32;
> +    const short decomp_rv64;
> +    const short decomp_rv128;
> +    const short decomp_data;
> +} rv_opcode_data;
> +
>  typedef struct {
>      uint64_t  pc;
>      uint64_t  inst;
> +    const rv_opcode_data *opcode_data;
>      int32_t   imm;
>      uint16_t  op;
>      uint8_t   codec;
> @@ -184,11 +201,6 @@ typedef struct {
>      uint8_t   rlist;
>  } rv_decode;
>
> -typedef struct {
> -    const int op;
> -    const rvc_constraint *constraints;
> -} rv_comp_data;
> -
>  enum {
>      rv_op_illegal =3D 0
>  };
> @@ -197,17 +209,6 @@ enum {
>      rvcd_imm_nz =3D 0x1
>  };
>
> -typedef struct {
> -    const char * const name;
> -    const rv_codec codec;
> -    const char * const format;
> -    const rv_comp_data *pseudo;
> -    const short decomp_rv32;
> -    const short decomp_rv64;
> -    const short decomp_rv128;
> -    const short decomp_data;
> -} rv_opcode_data;
> -
>  /* instruction formats */
>
>  #define rv_fmt_none                   "O\t"
> --
> 2.40.1
>
>

