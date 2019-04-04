Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hC1uz-0007Un-VV
	for mharc-qemu-riscv@gnu.org; Thu, 04 Apr 2019 08:56:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ijc@hellion.org.uk>) id 1hC1aw-0007cY-K0
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 08:35:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ijc@hellion.org.uk>) id 1hC1av-0005DE-OU
	for qemu-riscv@nongnu.org; Thu, 04 Apr 2019 08:35:50 -0400
Received: from benson.default.arb33.uk0.bigv.io ([2001:41c9:1:41d::16]:53607)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ijc@hellion.org.uk>)
	id 1hC1as-00050r-PP; Thu, 04 Apr 2019 08:35:47 -0400
Received: from [194.72.166.2] (helo=bokrug.cam.docker.com)
	by benson.default.arb33.uk0.bigv.io with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <ijc@hellion.org.uk>)
	id 1hC1al-00067G-82; Thu, 04 Apr 2019 13:35:39 +0100
Message-ID: <6b9005b62d51d3a1f44da142936e3d2b4b4dead5.camel@hellion.org.uk>
From: Ian Campbell <ijc@hellion.org.uk>
To: Alistair Francis <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Cc: "alistair23@gmail.com" <alistair23@gmail.com>, "palmer@sifive.com"
	<palmer@sifive.com>
Date: Thu, 04 Apr 2019 13:35:38 +0100
In-Reply-To: <99590ce3f3572a2b02216a5d99cec03ccc3f35a8.1553899050.git.alistair.francis@wdc.com>
References: <cover.1553899050.git.alistair.francis@wdc.com>
	<99590ce3f3572a2b02216a5d99cec03ccc3f35a8.1553899050.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:41c9:1:41d::16
X-Mailman-Approved-At: Thu, 04 Apr 2019 08:56:31 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for 4.1 v2 2/6] target/riscv:
 Fall back to generating a RISC-V CPU
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
X-List-Received-Date: Thu, 04 Apr 2019 12:35:51 -0000

On Fri, 2019-03-29 at 22:39 +0000, Alistair Francis wrote:
> +    for (i = 0; i < strlen(riscv_cpu); i++) {
> +        if (i == 0 && riscv_cpu[i] == 'r' &&
> +            riscv_cpu[i + 1] == 'v') {

Dpes something somewhere else enforce a minimum length or can
`riscv_cpu[i + 1]` be past the end of the string?

Similarly some more times below and also for the `i += 2` bits.

> +            /* Starts with "rv" */
> +            i += 2;
> +            if (riscv_cpu[i] == '3' && riscv_cpu[i + 1] == '2') {
> +                i += 2;
> +                valid = true;
> +                rvxlen = RV32;
> +            }
> +            if (riscv_cpu[i] == '6' && riscv_cpu[i + 1] == '4') {
> +                i += 2;
> +                valid = true;
> +                rvxlen = RV64;
> +            }
> +        }

Ian.


