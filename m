Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWqm7-0003fO-Dn
	for mharc-qemu-riscv@gnu.org; Tue, 11 Dec 2018 17:45:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gWqm4-0003au-85
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 17:45:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gWqm0-0004o9-Tq
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 17:45:08 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:32784)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gWqlx-0004kk-2b
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 17:45:02 -0500
Received: by mail-ot1-x343.google.com with SMTP id i20so15802304otl.0
	for <qemu-riscv@nongnu.org>; Tue, 11 Dec 2018 14:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=KEleUFftcCyK1PhVQbWMyg+NaRUAX5dfSFtPdugOz0Y=;
	b=Gn2Mz+9qDBQ1E6YVF7Ym4AI5L/aU7icBv4w6znhaTGdVA25newleh/bbhjbOunuqd9
	5FwxPSBXxC19HQEGvisTwC1Zo0XLJeXql/S4H8k0NnCMNYrWKHkl5grMf25iA0vqRS0k
	YeQCt9pgeA4LX1Dbvl/1UrKIZHo7iJWIXDFuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KEleUFftcCyK1PhVQbWMyg+NaRUAX5dfSFtPdugOz0Y=;
	b=BgxGVzgSCejH71tyTIRp4TBuaCHwp22rvCPKc7GElJtsBLOwowVZyMUVecdgt0FJ5E
	+i0Q3wmP5+8zRdt6pTFs/Vj1Oe7Gp2aC5Z7c/hzgvZ/W8UPJNfHbd2rWQ4qF7W2KoyiC
	oEL2ZIa+nmWQHhGtHyfqvrLzeReOdrey7dih2Bjj64a6ViNbaonmSRy5q5zSvrPrTlyX
	Dfo1sA4nmgv4Uaancz+rfGpcP/YurFz4laYRpBq1P/gRJOz+6AErhegGqIvh6SFr4xwk
	EkWoynWJuFJaJmX3RHe8tYNCvNopfBv43mdLdJxjt4FBD+p2/Uh1cNaoMqbxFq7E0w5E
	gdfw==
X-Gm-Message-State: AA+aEWZDTPK91cGf+aSBG4OE8QyGfB4dxbi3HarwaDiG3b8gYPf05Umh
	yjvLcMZAXOJOr/JMOJw9YAsVSw==
X-Google-Smtp-Source: AFSGD/Ufl4hoRjs2zXXFMQm+i+qna/vUB0S1QEUrrgVKsf6SxQhT/lfjDb9lpKRh1oi8PNaVHJmS2A==
X-Received: by 2002:a9d:348:: with SMTP id 66mr11996484otv.300.1544568299382; 
	Tue, 11 Dec 2018 14:44:59 -0800 (PST)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id
	52sm22478059oti.30.2018.12.11.14.44.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 14:44:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
	<c1cbe33881d567ee4712128282e6fcc49a5736b5.1544229872.git.alistair.francis@wdc.com>
	<98465a90-99cc-bce6-8cde-5025a30b3785@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <042678a6-6837-e272-e4fa-eb0a8f265e6b@linaro.org>
Date: Tue, 11 Dec 2018 16:44:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <98465a90-99cc-bce6-8cde-5025a30b3785@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-riscv] [RFC v3 19/24] riscv: tcg-target: Add the out op
 decoder
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
X-List-Received-Date: Tue, 11 Dec 2018 22:45:10 -0000

On 12/10/18 11:56 AM, Richard Henderson wrote:
> On 12/7/18 6:49 PM, Alistair Francis wrote:
>> +    case INDEX_op_neg_i64:
>> +        tcg_out_opc_imm(s, OPC_SUB, a0, TCG_REG_ZERO, a1);
> 
> tcg_out_opc_reg.
> 
>> +    case INDEX_op_mulsh_i32:
>> +    case INDEX_op_mulsh_i64:
>> +        tcg_out_opc_imm(s, OPC_MULH, a0, a1, a2);
>> +        break;
>> +
>> +    case INDEX_op_muluh_i32:
>> +    case INDEX_op_muluh_i64:
>> +        tcg_out_opc_imm(s, OPC_MULHU, a0, a1, a2);
>> +        break;
> 
> Likewise.

Incidentally, catching these sorts of errors is why tcg/s390 puts the format of
the insn into the enum.  E.g.

/* Emit an opcode with "type-checking" of the format.  */
#define tcg_out_insn(S, FMT, OP, ...) \
    glue(tcg_out_insn_,FMT)(S, glue(glue(FMT,_),OP), ## __VA_ARGS__)

    tcg_out_insn(s, RR, AR, a0, a2);
    tcg_out_insn(s, RRE, AGR, TCG_TMP0, index);

/* All of the following instructions are prefixed with their instruction
   format...  */
typedef enum S390Opcode {
    ...
    RR_AR       = 0x1a,
    RRE_AGR     = 0xb908,


I do something similar for tcg/aarch64, although that's more complicated due to
the wide variety of formats.

Whether you go back and retro-fit this scheme to your existing patch set is up
to you.  But I think it could be worthwhile.


r~

