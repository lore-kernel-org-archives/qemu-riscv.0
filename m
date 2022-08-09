Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLUyu-00071z-6z
	for mharc-qemu-riscv@gnu.org; Tue, 09 Aug 2022 15:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oLUyW-0006xw-Ey; Tue, 09 Aug 2022 15:33:16 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oLUyU-0000Qv-OJ; Tue, 09 Aug 2022 15:33:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P86f3O2iylakbWPUd/fTvG9LlnMuEiVrnVjl8Bh9B+0=; b=fZf4a2HIoZ+cNuBF+JUlXIVAlm
 jXf9JxXiXfONkxO8OjtpTgdUq04kN+kkAO3nAvvYaMq4YeCX5aw72XsPkamnJ1CUsz7fxcYexG3IE
 CbdDMpeza3mQjCXD/LAEKQiAazT1vq8bp3jLk3AGqqdDzWalqrftsMZ0OQBL1DCB/3SaXXlWKqO+f
 bdQOaqG06WCeOLGw6tUPPvW2NNdh7P40yj8b7J56xiOtma4rnM8oH+Cu0ul+46pwGbHOO88JXEHyi
 yCmI10Tr0sguokixKP1Mj9ppw0I/qYgvpTvIFVkXZV2x0VZk1F6WmvLJdNPDF0QZVeZ80Fvg8zuON
 fkaGZbNKFD+WMgwedsNMNl7IT18/X5Oj7C8eqNbzh7hqUfXsZiljD4lcWvgIUvpVf71KTUUoT95W8
 ZUwgXh6Lh2dWbvyOwBOhHKVeiTCQZvesA8tIwsyJW6pjbPHnQH3FjPsrws6ERoH51sTB8LmaIgzIb
 hRX7dquyhpDepCxiSiyWOJvAQXcPIyGgKpUsx9hYQfSmmjmsPckRw/sUhx0QPOShKuYJGHQcjtLci
 v3cMtmgHwGxNmFFFp9UXw2JYeeoFAgmk2j2IFbjB262FQl0Vg15TAmRJbT7GYfJud4XA1yqYCgqQG
 UxWLucqsRcGrVM+p7DLCVgpYXqKmepEIWQFfKnXOY=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oLUwu-0004KC-Hi; Tue, 09 Aug 2022 20:31:36 +0100
Message-ID: <aa83d672-0369-aad4-4aaa-e850b1aac3f3@ilande.co.uk>
Date: Tue, 9 Aug 2022 20:32:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Ben Dooks <ben@fluff.org>
Cc: Ben Dooks <qemu@ben.fluff.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20220727223905.624285-1-qemu@ben.fluff.org>
 <20220727223905.624285-6-qemu@ben.fluff.org>
 <CAFEAcA9DADLZaSrRmRLXxex6V1ewbi8zV+ey9NLv0JNPJOc9hw@mail.gmail.com>
 <20220809184838.en4x5kcxiatclmfy@hetzy.fluff.org>
 <CAFEAcA_-4U7NiXi94NeAQ2K1LZ3QEjEhufO==uU0=Mi5GKbOeA@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA_-4U7NiXi94NeAQ2K1LZ3QEjEhufO==uU0=Mi5GKbOeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 5/5] hw/arm: change to use qemu_fdt_setprop_strings()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 09 Aug 2022 19:33:33 -0000

On 09/08/2022 20:22, Peter Maydell wrote:

> On Tue, 9 Aug 2022 at 19:48, Ben Dooks <ben@fluff.org> wrote:
>>
>> On Mon, Aug 01, 2022 at 12:37:33PM +0100, Peter Maydell wrote:
>>> On Wed, 27 Jul 2022 at 23:44, Ben Dooks <qemu@ben.fluff.org> wrote:
>>>> @@ -285,8 +280,6 @@ static void fdt_add_gem_nodes(VersalVirt *s)
>>>>
>>>>   static void fdt_add_zdma_nodes(VersalVirt *s)
>>>>   {
>>>> -    const char clocknames[] = "clk_main\0clk_apb";
>>>> -    const char compat[] = "xlnx,zynqmp-dma-1.0";
>>>
>>> This looks suspiciously like a pre-existing bug to me.
>>> Alaistair, Edgar -- shouldn't this be a NUL-separated
>>> 'compatible' string, rather than a comma-separated one?
>>
>> I think the compat[] is fine, I should have probably added I also fixed
>> up to just call qemu_fdt_setprop_string()
> 
> I guess if it's definitely supposed to be one string instead of two that's OK.

FWIW the compat strings look like they are using the older <manufacturer>,<device> 
notation similar to SUNW,tcx and SUNW,cgthree so if Xilinx is the manufacturer I 
think they are correct.


ATB,

Mark.

