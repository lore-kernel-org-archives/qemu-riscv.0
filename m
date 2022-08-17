Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oODqe-0002O0-7W
	for mharc-qemu-riscv@gnu.org; Wed, 17 Aug 2022 03:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oODqZ-0002Ni-NR
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 03:52:16 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:42679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oODqW-0000Gv-9U
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 03:52:14 -0400
Received: by mail-ej1-x636.google.com with SMTP id j8so23100756ejx.9
 for <qemu-riscv@nongnu.org>; Wed, 17 Aug 2022 00:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc; bh=9xnYZhI92vOXcy2182GQb2h4xwg4jFW98roz/a4SU/A=;
 b=OVPwHYg3PU3Z1vHpdZlisRprs3ZQd23oZMt25zzQvA4883qfh+RBwDVN4uFxDpTaUv
 C9qsgkYCkWb0MfWTlcBpvQFweh7783eLF5y3zqqy81zNnQTdg4Cab25HiRYJmiN6C6ok
 JGnbhrPNb7Rg6OqyjPSmWSpM0iWYPIO3pKTEYLdd0fcrh7bStP+8bYmsafeTgBBepmlr
 H+Xeclbhy9XWP3C+xEhX7ZVAh34Wn5RE8jEtmpe1EggGde3g5dh6XgxQW90RspH42+2X
 FqOEorEJUsZDPS3rn2nxh7PsEHKXv0SS/v2kcPOlBx/wI4mItc5nbxw4HB8lek5nkRG4
 3Yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=9xnYZhI92vOXcy2182GQb2h4xwg4jFW98roz/a4SU/A=;
 b=PulLo08BgBpTrziXnDGuFFIg4sClnTlzVs43+KnC49+klZajZkhYN8cu7hX/gWNl7T
 KD5c/BvYOpu5BAOx3gkxav1rI0Wf3ncedjp6omLeYE5/8HFqr7uVXzkXwplEwz5dMuzg
 ZYyXJHHCrroyPjt83IzVRtEKWDSmGzubBWN6AVzdC2zIkNDapQEOzbHdiPnKaNCyCX1N
 QOXbg/UeU3CT4We0UNqdczw0xN6nBkAgseS8HL3vIJyHqzSFwlZBe4M73DlW3mzevpTF
 ZA5OMvO78Q9aLgXKxCubiuOhZpasslg7mvLoaEpuZMdMt7t64VOiAXlEFMfn6ta2Qm7C
 M6zA==
X-Gm-Message-State: ACgBeo1omTdv0kJ5dY+PXX6DZ6QEKbdj1IlHAgG9Upvmk5Q0mZaUvPBt
 IAEKE8bsTwsNash09+pOrn+Nhg==
X-Google-Smtp-Source: AA6agR4ZX88kMxjHrS7fizpdk5LNncHR+I8re7ouM/1AQdHMVm8e+M7j2Vx1kRtOIyRqd7OBX7nsKA==
X-Received: by 2002:a17:907:b590:b0:730:9e0f:e9a3 with SMTP id
 qx16-20020a170907b59000b007309e0fe9a3mr15396358ejc.112.1660722729843; 
 Wed, 17 Aug 2022 00:52:09 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 o6-20020aa7c506000000b0043e8334f762sm10030717edq.65.2022.08.17.00.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 00:52:08 -0700 (PDT)
Date: Wed, 17 Aug 2022 09:52:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor.Dooley@microchip.com
Cc: jrtc27@jrtc27.com, palmer@dabbelt.com, robh@kernel.org,
 tglx@linutronix.de, maz@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, daniel.lezcano@linaro.org,
 anup@brainfault.org, guoren@kernel.org, sagar.kadam@sifive.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH 0/3] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Message-ID: <20220817075207.dvylesvqaoc7ga4r@kamzik>
References: <20220805162844.1554247-1-mail@conchuod.ie>
 <YvGBYKZyW0B2/wSr@Jessicas-MacBook-Pro>
 <94fe7e46-6156-1cc5-a4dc-1eee78e99bc4@microchip.com>
 <20220809141436.GA1706120-robh@kernel.org>
 <61829ccd-20d7-e2f0-0a6b-bcd0e076b9ea@microchip.com>
 <1d94e18d-7f51-0619-95a9-6ca5fa7d9671@microchip.com>
 <20220816140633.pkjws7n3qxsescjh@kamzik>
 <5abe9b30-274a-8f36-0797-cc0e981c3f70@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5abe9b30-274a-8f36-0797-cc0e981c3f70@microchip.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 17 Aug 2022 07:52:18 -0000

On Tue, Aug 16, 2022 at 10:53:45PM +0000, Conor.Dooley@microchip.com wrote:
> Hey Drew,
> Thanks for piping up.
> 
> On 16/08/2022 15:06, Andrew Jones wrote:
> > [You don't often get email from ajones@ventanamicro.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Mon, Aug 15, 2022 at 07:18:02PM +0000, Conor.Dooley@microchip.com wrote:
> >> Any takers on trashing my regex? Otherwise I'll just submit
> >> a v2 with the regex and it can be shat on there instead :)
> >>
> >> On 09/08/2022 19:36, Conor Dooley wrote:
> >>> On 09/08/2022 15:14, Rob Herring wrote:
> >>>> On Mon, Aug 08, 2022 at 10:01:11PM +0000, Conor.Dooley@microchip.com wrote:
> >>>>> On 08/08/2022 22:34, Jessica Clarke wrote:
> >>>>>> On Fri, Aug 05, 2022 at 05:28:42PM +0100, Conor Dooley wrote:
> >>>>>>> From: Conor Dooley <conor.dooley@microchip.com>
> >>>>>>> The final patch adds some new ISA strings
> >>>>>>> which needs scruitiny from someone with more knowledge about what ISA
> >>>>>>> extension strings should be reported in a dt than I have.
> >>>>>>
> >>>>>> Listing every possible ISA string supported by the Linux kernel really
> >>>>>> is not going to scale...
> >>>>
> >>>> How does the kernel scale? (No need to answer)
> >>>>
> >>>>> Yeah, totally correct there. Case for adding a regex I suppose, but I
> >>>>> am not sure how to go about handling the multi-letter extensions or
> >>>>> if parsing them is required from a binding compliance point of view.
> >>>>> Hoping for some input from Palmer really.
> >>>>
> >>>> Yeah, looks like a regex pattern is needed.
> >>>
> >>> I started pottering away at this but I have arrived at:
> >>> rv64imaf?d?c?h?(_z[imafdqcbvkh]([a-z])*)*$
> > 
> > Don't forget the ^ at the start.
> > 
> > Do we need to worry about optional major and minor version numbers?
> > Or check that Z names have at least one character following the category
> > character? Actually, the first letter after Z being a category is only a
> > convention. Maybe we don't want to enforce that. What about X extensions?
> 
> For the character after Z, I think we could operate on the assumption
> that that's a convention until things change. The regex isnt set in
> stone forever.
> With x, it becomes - which to me makes bad worse:
> ^rv64imaf?d?q?c?b?v?k?h?(?:(?:_z[imafdqcbvkh]|_x)(?:[a-z])*)*$

I think we should change the ([a-z]*) to ([a-z]+).

> 
> and then for the version numbers it becomes completely awful.
> I'd argue that if we are going to support those, then we should
> do that as another regex. We are already forcing lower case in
> these ISA strings - is there an actual benefit in adding the
> numbers, or might we want to "encourage" removing those too?
> 
> I hope I am missing something, as my regex foo isn't that good, to
> enforce the ordering & the numbers - even for the simple case of the
> major number only, we'd need to convert "f?" to "(?:f\d+)?" and so
> on for every single extension. I don't think we reduce that either
> as we want to enforce the ordering.
> 
> For the minor versions it goes to "(?:f\d+p\d+)?". At that point I
> don't think we are adding any value but w/e, who am I to decide.
> That ballooned out to 194 characters for me. I then decided to have
> a bit of fun, and just do both number sets as a oneliner, using
> some named match groups. That was about 255 characters. 😍
> Anyway, dt-schema had a panic attack at something I was doing
> so I think that /may/ be a bad idea.

I presume if a version is used it means one cannot rely on the default
version. So we can't always encourage them to be removed. To simplify
things we can always require minor numbers. We can also always require
underscores. Something like

^rv64_i(\d+p\d+)?_m\1?_a\1?(_f\1?)?(_d\1?)? ... ((_z[imafdqcbvkh]|_x)[a-z]+\1?)*$

> 
> I vote for allow the x extensions, keep the convention for standard
> extensions & revisit this in the future if needed...

Sounds good. We can also easily add _s|_h|_zxm to the OR if we want. But,
there is a problem with the OR. By using it we don't enforce order. To be
pedantic we should ensure _z comes before _s, then _h, then _zxm, then _x.

Thanks,
drew

