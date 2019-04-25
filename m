Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hJh1t-0008Ov-4s
	for mharc-qemu-riscv@gnu.org; Thu, 25 Apr 2019 12:15:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJh1q-0008LA-Pl
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 12:15:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJh1p-0008Cm-U7
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 12:15:18 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:42853)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJh1p-0008BU-ML
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 12:15:17 -0400
Received: by mail-pg1-x543.google.com with SMTP id p6so76715pgh.9
	for <qemu-riscv@nongnu.org>; Thu, 25 Apr 2019 09:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7mbYizEmUBiE4p7G0c1ojVSDGX1keCabGEKT8GbczDw=;
	b=mhcFZvW59E7OrZbqja73JGhbUEsgsNTyhxY6FYiZLYCFTmA11+dnq3oy8eOXOOmtHe
	6TNgFyRvSAY1e/1PLkNdQ/HzOgKLsPxV5w2JSjUU0GakyWwqT50eT078r0Uql2b/Je/i
	Bgvxxar/iGLZ3A17/r5h6kNku6HJs+HAi0Vc2V0nKLgZGaLYfr/VWRG5voNzXklQO66g
	w2SZOPRONIUTXVNAhtPY7+geffZFPdyK8vLk9zRi1Frm3iNxnC2WPBmY+3lxhemBBxSa
	HcYIUm/sopBvg49I4qBQ5t+9qlMOiOzitS9c4/MKBT2jVDA8fU1kQeFebhhoeSWEshWA
	JjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7mbYizEmUBiE4p7G0c1ojVSDGX1keCabGEKT8GbczDw=;
	b=b5ae55KNZ3sxHy0QrYzr54d+NW2hazc/gBwb7ytk7Y8jECo0/Wa/iDto/w7JM9LyQl
	LFQ5KMW62FjzkGPy1CWoKHmycQkO1y3aGpvXLFU9JlMWZHsY6pJmsie5kNpC+JUN0c6s
	27d57mFMQUuBjz7MFsY+5y7ItnAErAYyJyTRubPt5phuLcz2vZmjk5kBsvEjxfZCbFmf
	ZisfR53aqbx8K3m2WvR/DJFBCo5hXfW1j+7t/HutbyCh3HL4xPT0CswslIAnpxmQSIa9
	kYotIBm/sq0sv6f9gFRbdF/2+sAfdHKAIjVFbKQM03IBliGRsz3BXOCmoy+wglFsQh/b
	pNcA==
X-Gm-Message-State: APjAAAX5nFoUuCMOGjoVdyM+2QRRQyQxSG4e/xuM9OTjx6wKzCJer45j
	QgCqIy1u/MwwZikbJinI4+LI3GP2Dk0=
X-Google-Smtp-Source: APXvYqzugL2NbhFhMIY0fcA85B6PFVrNCHtp/wpSBld+va70aJaEmgSszjVagRy4b93Y2vCJECnXnA==
X-Received: by 2002:a63:fc43:: with SMTP id r3mr37529685pgk.44.1556208915937; 
	Thu, 25 Apr 2019 09:15:15 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	g63sm35484217pfc.127.2019.04.25.09.15.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 09:15:15 -0700 (PDT)
To: Palmer Dabbelt <palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann
	<kbastian@mail.uni-paderborn.de>, Alistair Francis
	<Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org
References: <mhng-3e3866ac-838d-4c70-8dd4-880201b74b8a@palmer-si-x1e>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c20ee4b9-d6c0-9bce-219b-24d3496cd460@linaro.org>
Date: Thu, 25 Apr 2019 09:15:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <mhng-3e3866ac-838d-4c70-8dd4-880201b74b8a@palmer-si-x1e>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-riscv] [PATCH for-4.1 3/8] target/riscv: Merge argument
 sets for insn32 and insn16
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
X-List-Received-Date: Thu, 25 Apr 2019 16:15:19 -0000

On 4/25/19 9:04 AM, Palmer Dabbelt wrote:
> c.lwsp with rd=0 should be an illegal instruction, but it's not.  We'd need to
> re-introduce the shim to handle that quirk, but since it's not actually a new
> bug I'm OK taking the patch set and fixing that later.

That should be fixable in the decode file, without a shim.
See patch 5, where I introduce trans_illegal, for doing
exactly this for c.addi4spn.


r~

