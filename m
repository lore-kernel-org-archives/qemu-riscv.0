Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXF4x-0004uI-If
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 19:42:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gXF4t-0004u7-Rz
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 19:42:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gXF4p-0005HK-Np
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 19:42:09 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36350)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gXF4i-00051d-3P; Wed, 12 Dec 2018 19:42:02 -0500
Received: by mail-pf1-x441.google.com with SMTP id b85so169494pfc.3;
	Wed, 12 Dec 2018 16:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=JomxuhEHpJMG0vBA83yPM0kSJ9+wcUiXIy8fjssv38g=;
	b=Tpgvr3cBVaeSSNoTf/LhxM2ZNLKikfi0d3xjABHiEPDTmGqRw85aRI0EbbpHAkJcku
	htgBzJlRLr862L7DaoisVExepYuweuCRVIdD8zok0D1WmSHVIuqYyrzRj7Ex7GUKBrFW
	6PruBhB8QudoHtTkG+37PSy/TAW0L0dejPNbQf9ux58a6/eH5kGVkCFGQ3DsZGr8sjDu
	B4nGiDAFM7MAi20kaowN/Mwe4ItVcxFpiNqwp5ApjdbFU7kRYbP3aihFuvS3ip8yOclT
	wIZhsr5pchjgjf7V0l6Lky3lAK5pCdxANuPJkubR0AP3sS2MuVsouhjC7KwR9HD1nvfh
	yDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JomxuhEHpJMG0vBA83yPM0kSJ9+wcUiXIy8fjssv38g=;
	b=muMfngOWiGp+ZOowO3714xqMyNFMrWyHsSykwmuhmyIIiXse9UAMhuIgQzLngquOkR
	L7SUZETYxJryo19AsqRyJZX1vopypX9w6BtOPFAWyppRJoQ3/ivtJVeFNuxxn6h4CylY
	lpiZ61Odi1HFi0tFzN4YYpFJ9iCQhm0C9SUf5x9ys4hG9w7cErwWXkYzczZKbjjQNr9j
	IGMBSmIkQXZhtNxw8FJq8QCRCBaaKiHVEh47eLDK/n9vDxmYqmSysXNQ5/MI8FWKlrKr
	B+XOTrJKF2fG2h2d8pgqEzLrr1+1vSKgcEa5Ihi9sJs4dP/Fdrpkwk8dqafSsSiXFv+V
	hWbw==
X-Gm-Message-State: AA+aEWbXoORdgnv3hogUV+sa5Rg4IHkM7wCRxvLfZJmtzBgEAIlyKdMl
	0egnT/EclXGxUW4jGT595KubIgyy
X-Google-Smtp-Source: AFSGD/W2yZW26SVvnL+T23hIsGeHRD4/hN7oexYC1NnFQVPCBrsndKBNimTmK8I7emG6WcdeVZPnsQ==
X-Received: by 2002:a63:f141:: with SMTP id o1mr20327189pgk.134.1544661711970; 
	Wed, 12 Dec 2018 16:41:51 -0800 (PST)
Received: from ?IPv6:2601:646:8e00:dca:6bcc:38b1:fed7:e746?
	([2601:646:8e00:dca:6bcc:38b1:fed7:e746])
	by smtp.gmail.com with ESMTPSA id j9sm215045pfi.86.2018.12.12.16.41.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Dec 2018 16:41:50 -0800 (PST)
To: Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
References: <cover.1544643238.git.alistair.francis@wdc.com>
	<89a7db22-6744-0fb5-e543-847569e942c4@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Message-ID: <c799a3f8-9a49-e789-9cfd-ed5990bc7809@gmail.com>
Date: Wed, 12 Dec 2018 16:41:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <89a7db22-6744-0fb5-e543-847569e942c4@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-riscv] [PATCH v1 00/23] Add RISC-V TCG backend support
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
X-List-Received-Date: Thu, 13 Dec 2018 00:42:13 -0000

On 12/12/2018 3:33 pm, Richard Henderson wrote:
> On 12/12/18 1:42 PM, Alistair Francis wrote:
>> As this is all new work (so can't cause regressions) I'm starting the
>> patch series process with what we have so far. That way others can help
>> contribute and test. If anyone has strong feelings for missing functionality
>> let me know and we can work on adding that before this is merged.
> 
> I'd be ok merging this immediately after the bswap patches currently queued on
> my tcg-next-2 branch.  Which for you just means defining
> TCG_TARGET_HAS_MEMORY_BSWAP to 0 and fixing the one MAINTAINERS entry.
> 
> Anything else can be fixed or improved via normal development.

Awesome!

I have fixed the maintainers file and defined 
TCG_TARGET_HAS_MEMORY_BSWAP to 0 (no effect yet) in my tree.

Unless anyone else has any comments I'm just going to sit on these 
patches until your branch is merged then I'll send a v2.

Alistair

> 
> 
> r~
> 


