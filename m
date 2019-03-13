Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h40Qv-0001CL-8k
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 05:44:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1h40Qs-0000a0-2O
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 05:44:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1h40EA-0005ty-MI
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 05:31:11 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:54164)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1h40E8-0005oz-Nk; Wed, 13 Mar 2019 05:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.uni-paderborn.de; s=20170601;
	h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=N/EScPWohqHIgu46es41Bj7XWLSPEuo0YMRQLJj+sSQ=;
	b=pLtZ6LtLkbjzsC2Mz03H8QTNPN
	BJhi7cbDDCxdI7tgjGgpAKbC4i9r/9ldVkkXSGAJc2SMxtXAbWWwM7q3wP1nLz63RZnjak1RXZKwO
	bMUy/+pMGQW2YCRY4gDgTRvPSkiFI0CxNE4VS5OAebcUYEMUpyMVu8rOOhKVkGTY/S0Y=; 
To: Peter Maydell <peter.maydell@linaro.org>,
	Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <20190312131526.14710-1-palmer@sifive.com>
	<CAFEAcA_hZLO032+gPuoy6enJvssjiZBUtBaC_pG4BGUPR3F0kQ@mail.gmail.com>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <108e3974-e305-4a0b-69cf-92809ddc117c@mail.uni-paderborn.de>
Date: Wed, 13 Mar 2019 10:31:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_hZLO032+gPuoy6enJvssjiZBUtBaC_pG4BGUPR3F0kQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US-large
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.3.13.92116, AntiVirus-Engine: 5.58.0,
	AntiVirus-Data: 2019.2.22.5580002
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL] target/riscv: Convert to
 decodetree
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
X-List-Received-Date: Wed, 13 Mar 2019 09:44:19 -0000


On 3/12/19 7:31 PM, Peter Maydell wrote:
> On Tue, 12 Mar 2019 at 13:15, Palmer Dabbelt <palmer@sifive.com> wrote:
>> The following changes since commit 377b155bde451d5ac545fbdcdfbf6ca17a4228f5:
>>
>>    Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2019-03-11 18:26:37 +0000)
>>
>> are available in the Git repository at:
>>
>>    git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.0-sf3
>>
>> for you to fetch changes up to a971f8ae0e8ab6fab1eee199961b1ea2f4d876f7:
>>
>>    target/riscv: Remove decode_RV32_64G() (2019-03-12 03:08:34 -0700)
>>
>> ----------------------------------------------------------------
>> target/riscv: Convert to decodetree
>
> I'm still seeing some errors about redefining typedefs, I'm afraid:
>
> target/riscv/decode_insn16.inc.c:102:28: error: redefinition of
> typedef 'arg_c_addi16sp_lui' is a C11 feature
> [-Werror,-Wtypedef-redefinition]
> target/riscv/decode_insn16.inc.c:122:17: error: redefinition of
> typedef 'arg_c_j' is a C11 feature [-Werror,-Wtypedef-redefinition]
> target/riscv/decode_insn16.inc.c:134:26: error: redefinition of
> typedef 'arg_c_flwsp_ldsp' is a C11 feature
> [-Werror,-Wtypedef-redefinition]
> target/riscv/decode_insn16.inc.c:144:26: error: redefinition of
> typedef 'arg_c_fswsp_sdsp' is a C11 feature
> [-Werror,-Wtypedef-redefinition]
> target/riscv/decode_insn16.inc.c:102:28: error: redefinition of
> typedef 'arg_c_addi16sp_lui' is a C11 feature
> [-Werror,-Wtypedef-redefinition]
> target/riscv/decode_insn16.inc.c:122:17: error: redefinition of
> typedef 'arg_c_j' is a C11 feature [-Werror,-Wtypedef-redefinition]
> target/riscv/decode_insn16.inc.c:134:26: error: redefinition of
> typedef 'arg_c_flwsp_ldsp' is a C11 feature
> [-Werror,-Wtypedef-redefinition]
> target/riscv/decode_insn16.inc.c:144:26: error: redefinition of
> typedef 'arg_c_fswsp_sdsp' is a C11 feature
> [-Werror,-Wtypedef-redefinition]
>
> thanks
> -- PMM
>

Hi Peter,

this should fix it:

diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 0829e3bc59..1a461616aa 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -50,15 +50,15 @@
  &cs_dw     uimm   rs1 rs2
  &cb        imm    rs1
  &cr               rd  rs2
-&c_j       imm
+&cj       imm
  &c_shift   shamt      rd

  &c_ld      uimm  rd
  &c_sd      uimm  rs2

-&c_addi16sp_lui  imm_lui imm_addi16sp rd
-&c_flwsp_ldsp    uimm_flwsp uimm_ldsp rd
-&c_fswsp_sdsp    uimm_fswsp uimm_sdsp rs2
+&caddi16sp_lui  imm_lui imm_addi16sp rd
+&cflwsp_ldsp    uimm_flwsp uimm_ldsp rd
+&cfswsp_sdsp    uimm_fswsp uimm_sdsp rs2

  # Formats 16:
  @cr        ....  ..... .....  .. &cr rs2=%rs2_5  %rd
@@ -72,17 +72,17 @@
  @cs_d      ... ... ... .. ... .. &cs_dw  uimm=%uimm_cl_d rs1=%rs1_3  
rs2=%rs2_3
  @cs_w      ... ... ... .. ... .. &cs_dw  uimm=%uimm_cl_w rs1=%rs1_3  
rs2=%rs2_3
  @cb        ... ... ... .. ... .. &cb     imm=%imm_cb rs1=%rs1_3
-@cj        ...    ........... .. &c_j    imm=%imm_cj
+@cj        ...    ........... .. &cj    imm=%imm_cj

  @c_ld      ... . .....  ..... .. &c_ld uimm=%uimm_6bit_ld  %rd
  @c_lw      ... . .....  ..... .. &c_ld uimm=%uimm_6bit_lw  %rd
  @c_sd      ... . .....  ..... .. &c_sd uimm=%uimm_6bit_sd  rs2=%rs2_5
  @c_sw      ... . .....  ..... .. &c_sd uimm=%uimm_6bit_sw  rs2=%rs2_5

-@c_addi16sp_lui ... .  ..... ..... .. &c_addi16sp_lui %imm_lui 
%imm_addi16sp %rd
-@c_flwsp_ldsp   ... .  ..... ..... .. &c_flwsp_ldsp 
uimm_flwsp=%uimm_6bit_lw \
+@c_addi16sp_lui ... .  ..... ..... .. &caddi16sp_lui %imm_lui 
%imm_addi16sp %rd
+@c_flwsp_ldsp   ... .  ..... ..... .. &cflwsp_ldsp 
uimm_flwsp=%uimm_6bit_lw \
      uimm_ldsp=%uimm_6bit_ld %rd
-@c_fswsp_sdsp   ... .  ..... ..... .. &c_fswsp_sdsp 
uimm_fswsp=%uimm_6bit_sw \
+@c_fswsp_sdsp   ... .  ..... ..... .. &cfswsp_sdsp 
uimm_fswsp=%uimm_6bit_sw \
      uimm_sdsp=%uimm_6bit_sd rs2=%rs2_5

  @c_shift        ... . .. ... ..... .. &c_shift rd=%rs1_3 
shamt=%nzuimm_6bit


@Palmer: I send a fixed version of the offending patch.

Cheers,

Bastian




