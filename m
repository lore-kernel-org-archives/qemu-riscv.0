Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKpit-00089f-L8
	for mharc-qemu-riscv@gnu.org; Thu, 08 Nov 2018 14:12:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKpir-00089N-6N
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 14:12:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gKpin-0000R9-QZ
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 14:12:09 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gKpin-0000O7-20
	for qemu-riscv@nongnu.org; Thu, 08 Nov 2018 14:12:05 -0500
Received: by mail-pg1-x541.google.com with SMTP id 32-v6so9265837pgu.2
	for <qemu-riscv@nongnu.org>; Thu, 08 Nov 2018 11:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=nV8QZQTnlHMlhf0aTfd43HvCp1eNVTVPktM6oVAJWos=;
	b=ZVY6FsLFmbEYfJQfgf19M1JVjVvnxcQGt6RltfksVH9AsWJDOFv7DrfKYEbGl9h3lR
	yZ8O1o7uLqIpj+Uo8Z69UMKmWawhjcdSEsmW3u0bA72ZlC8wiGYI62Dh4ZSb5P2uH8e2
	QCTsBZ1iMv9KEze16XpCUfS6HHBTVYqzWc2DbkbEbGbxO5VN6cFBrDRMeYeqPc17SH7m
	glotSc8QESVoXeCyRBW3xn7A4yalMikMbHpUtLa1pbP85mzikw6JzIFaN5soYzd5hqcp
	yUdmRgRNMOAVvzA3WMYtEvWleMqW7C+YrmC9Q0ZhgDJukTOx06IVun4TtDl9fhJ3LPoa
	Fn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=nV8QZQTnlHMlhf0aTfd43HvCp1eNVTVPktM6oVAJWos=;
	b=j4cFkTjdlqvsjWNp94liRmL5c0vXq8vRIt6I31vOYf4Rzi3ESPlkUzLZ+Qzduqpg1V
	/av1U7MiDICbtJmooKol0rS8Xpsqx1qSZl28aXp9gqVFuFu3Z31i5YXqk7cC73tdHY9l
	zaP4RKufZgyWS/CIQn5bQnpQunXXy/OYrvrb8gprGnNJxpIBbshOWTUQF3zQOBMAy90k
	HNMhDFWBCO5kz8d8lMm4qRQvgDlNGvWZwmk+rSMEfdpjV9L+b+40ooEIkvh6rcy2g9WQ
	+y+vZpzB6TC/7zBigeV7Jeqh9BuJeyL4jKzxsIMbAz38s44HNVwDOLwcuy41HrvgSPDZ
	q0BQ==
X-Gm-Message-State: AGRZ1gJJyafzoy9PBI+gJH07046639qnRAWnH4Fvvc5tvGjeky3/tcTd
	N/hU8WJzohLQgo972Z51GbfYZQ==
X-Google-Smtp-Source: AJdET5frtwzgG5OObk/0gaVmjIH2l1wGXzDmUGhPQYHc+2/9gz0QwfQnG0cRrcrdyEbxHZTeErkiAA==
X-Received: by 2002:a63:9f0a:: with SMTP id
	g10-v6mr4517431pge.232.1541704321397; 
	Thu, 08 Nov 2018 11:12:01 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	w66-v6sm4668343pfb.51.2018.11.08.11.12.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 11:12:00 -0800 (PST)
Date: Thu, 08 Nov 2018 11:12:00 -0800 (PST)
X-Google-Original-Date: Thu, 08 Nov 2018 11:11:34 PST (-0800)
In-Reply-To: <d6ec0bb8-1ea6-c032-5643-2248ce7647a6@mail.uni-paderborn.de>
CC: richard.henderson@linaro.org, Michael Clark <mjc@sifive.com>,
	sagark@eecs.berkeley.edu, Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <mhng-133c83c5-d4e7-402a-935f-3ed9ca6b44b3@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 0/2] target/riscv: Bugfixes
 found in decodetree conversion
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Nov 2018 19:12:10 -0000

On Thu, 08 Nov 2018 09:29:26 PST (-0800), Bastian Koppelmann wrote:
>
> On 11/8/18 4:53 PM, Richard Henderson wrote:
>> On 11/8/18 1:06 PM, Bastian Koppelmann wrote:
>>> while going through the reviews of the riscv-decodetree patches, two bugs came
>>> up that I fix here. There is one more problem [1] mentioned by Richard but
>>> I don't have the time to investigate it further.
>>>
>>> [1] https://patchwork.kernel.org/patch/10650293/
>> That one's not a bug, but an optimization.
>>
>> The other bug mentioned is shrw and shaw not sign-extending the result.
>
>
> That was a bug I introduced during the conversion to decodetree.

My understand of that patch feedback is that there are two issues:

* We don't take advantage of the ordering bits on fences, which could allow us 
  to emit less conservative fences.  This would presumably increase 
  performance.
* We treat fences as NOPs under "#ifndef CONFIG_USER_ONLY", which is a bug.

Am I wrong about that second one?  I think the fix should look something like 
this, which I haven't even tried to compile

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 18d7b6d1471d..624d1c679a84 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1766,7 +1766,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
                      GET_RM(ctx->opcode));
         break;
     case OPC_RISC_FENCE:
-#ifndef CONFIG_USER_ONLY
         if (ctx->opcode & 0x1000) {
             /* FENCE_I is a no-op in QEMU,
              * however we need to end the translation block */
@@ -1777,7 +1776,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
             /* FENCE is a full memory barrier. */
             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
         }
-#endif
         break;
     case OPC_RISC_SYSTEM:
         gen_system(env, ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,


