Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPNGB-0001GL-4x
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 02:49:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gPNG7-00016Z-3a
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 02:49:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gPNAG-00056j-ST
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 02:43:15 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54448)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gPNAG-00055o-Mk
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 02:43:12 -0500
Received: by mail-wm1-x32f.google.com with SMTP id r63-v6so4463123wma.4
	for <qemu-riscv@nongnu.org>; Tue, 20 Nov 2018 23:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=XZYCdoFGUpZfVsJFTkRf1OJdaPa++EdEEYsyV6YJ8TA=;
	b=ZMPiIw2DR8r7nyZ0dhfuzBeJ8GXli+j/PdKT32QqxshLLm0brpxSjhNibKeE0AITBx
	u+1H1WmAopBGf3SWiNYOT5BWYBcWIdGc5NHJ/df26SM6dzs9hbATXZvJJ5gDtYQTKcOX
	5Yuf0V7pUJ6RKUT6ebDfP1ZwFZCypEf67ORYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XZYCdoFGUpZfVsJFTkRf1OJdaPa++EdEEYsyV6YJ8TA=;
	b=GN65pQdxc+JsdUseDqCOJn+EviGr2794LiOU1EHjePkrZC92KQFzq5PN2EyG8foKZi
	UV7Ci+bKZTKO4cYJwGWeTyWE1X5jrmF1GEaj6hsnkCqvBFWrJ35TEdvy90z3FcbtLWSG
	i0wlKsWK3BkOtDxx5PvoBu3E+DcSdqm8i4R6H1wv4ab7kaUUjU6P2d2JmLISpn8cbJ01
	wFpPVEi5opEp2RACJpae0dKeOAhah8c7I2rRpfyl6S9X5IVEWcEt52ZDpx2dsoPAxi3e
	WeelCVGente0kzAJK3VI2ljgwep0mOCONOwYe7RVezVdwAkuRepX1MpEf0GNqfSQpvYB
	fNnA==
X-Gm-Message-State: AA+aEWZl4Nwd4OHnQowAP/N1LOqEyApnryYdeyyOSh7wsInNPaDmBRys
	ni15BStsfia1LXkTwpxf6NJSDOKfZ5kmzg==
X-Google-Smtp-Source: AFSGD/VDTF5Ec2PPL+1oUatIAHbtDnyGM2wvg0cWrxVe6HBu22zLlPCH/HZ5xpX2xDs3HNlLAGZyeQ==
X-Received: by 2002:a1c:e0d:: with SMTP id 13mr4886448wmo.52.1542786191347;
	Tue, 20 Nov 2018 23:43:11 -0800 (PST)
Received: from cloudburst.twiddle.net ([195.77.246.50])
	by smtp.gmail.com with ESMTPSA id
	j199sm404566wmf.13.2018.11.20.23.43.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 23:43:10 -0800 (PST)
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
References: <cover.1542321076.git.alistair.francis@wdc.com>
	<bd8f5c781f7086c5b26e1bd4c8e6570b5534b22d.1542321076.git.alistair.francis@wdc.com>
	<f56a1b1c-8cc8-7e85-c88b-3894e4628d6b@linaro.org>
	<CAKmqyKMJm-hcBLeP5-hWW-0Sru8ggFVWFZRCiHhZ4romx-ej4g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <09e882be-660e-03e9-34cd-7f667f09d7af@linaro.org>
Date: Wed, 21 Nov 2018 08:43:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMJm-hcBLeP5-hWW-0Sru8ggFVWFZRCiHhZ4romx-ej4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::32f
Subject: Re: [Qemu-riscv] [Qemu-devel] [RFC v1 16/23] riscv: tcg-target: Add
 slowpath load and store instructions
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
X-List-Received-Date: Wed, 21 Nov 2018 07:49:18 -0000

On 11/21/18 1:18 AM, Alistair Francis wrote:
> On Fri, Nov 16, 2018 at 1:24 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 11/15/18 11:36 PM, Alistair Francis wrote:
>>> +static void tcg_out_mb(TCGContext *s, TCGArg a0)
>>> +{
>>> +    static const RISCVInsn fence[] = {
>>> +        [0 ... TCG_MO_ALL] = OPC_FENCE_RW_RW,
>>> +        [TCG_MO_LD_LD]     = OPC_FENCE_R_R,
>>> +        [TCG_MO_ST_LD]     = OPC_FENCE_W_R,
>>> +        [TCG_MO_LD_ST]     = OPC_FENCE_R_W,
>>> +        [TCG_MO_ST_ST]     = OPC_FENCE_W_W,
>>> +        [TCG_BAR_LDAQ]     = OPC_FENCE_R_RW,
>>> +        [TCG_BAR_STRL]     = OPC_FENCE_RW_W,
>>> +        [TCG_BAR_SC]       = OPC_FENCE_RW_RW,
>>> +    };
>>> +    tcg_out32(s, fence[a0 & TCG_MO_ALL]);
>>> +}
>>> +
>>
>> TCG_MO_* and TCG_BAR_* are two different bitmasks, or'ed together.
>> Which you've separated by "& TCG_MO_ALL".  Thus the TCG_BAR_* constants should
>> not appear in this table.
>>
>>
>>> +static void * const qemu_ld_helpers[16] = {
>>> +    [MO_UB]   = helper_ret_ldub_mmu,
>>> +    [MO_SB]   = helper_ret_ldsb_mmu,
>>> +    [MO_LEUW] = helper_le_lduw_mmu,
>>> +    [MO_LESW] = helper_le_ldsw_mmu,
>>> +    [MO_LEUL] = helper_le_ldul_mmu,
>>> +    [MO_LESL] = helper_le_ldsl_mmu,
>>> +    [MO_LEQ]  = helper_le_ldq_mmu,
>>> +    [MO_BEUW] = helper_be_lduw_mmu,
>>> +    [MO_BESW] = helper_be_ldsw_mmu,
>>> +    [MO_BEUL] = helper_be_ldul_mmu,
>>> +    [MO_BESL] = helper_be_ldsl_mmu,
>>> +    [MO_BEQ]  = helper_be_ldq_mmu,
>>> +};
>>
>> The LESL and BESL functions will not be present for rv32 -> link error.  Here
>> you do need an ifdef.
>>
>>> +        } else {
>>> +            adj = cmp_off - sextract32(cmp_off, 0, 12);
>>> +            tcg_debug_assert(add_off - adj >= -0x1000
>>> +                             && add_off - adj < 0x1000);
>>> +
>>> +            tcg_out_opc_upper(s, OPC_LUI, base, adj);
>>> +            tcg_out_opc_reg(s, OPC_ADD, base, TCG_REG_ZERO, TCG_AREG0);
>>
>> base, base, TCG_AREG0.
>>
>>> +    /* Compare masked address with the TLB entry. */
>>> +    label_ptr[0] = s->code_ptr;
>>> +    tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
>>
>> Another case of a potential out-of-range branch.
>>
>> It might be worthwhile to move all of this out-of-line from the start, where
>> that branch will always be short.  See
>>
>> http://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg02234.html
> 
> That does look cool, but it's not in the tree yet.

No, but it'll probably be in tree before this code is.  ;-)
I'll put it into my tcg-next-for-4.0 branch, and you can base off that.

> Otherwise can we directly just call tcg_out_brcond()?

Not quite, because there's no label structure.  But you can break out
subroutines and use those.

> PS: Thanks for your review. I have gone through most of your comments.
> I now don't see any segfaults when running. My guest still doesn't
> boot, but it's getting further then it used to :)

Excellent.


r~


