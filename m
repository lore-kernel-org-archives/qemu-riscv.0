Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ocx8y-0004j6-Mt
	for mharc-qemu-riscv@gnu.org; Mon, 26 Sep 2022 19:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1ocx8x-0004hU-J9
 for qemu-riscv@nongnu.org; Mon, 26 Sep 2022 19:04:07 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:40618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1ocx8u-0000kb-Cn
 for qemu-riscv@nongnu.org; Mon, 26 Sep 2022 19:04:07 -0400
Received: by mail-pg1-x52a.google.com with SMTP id s26so7853509pgv.7
 for <qemu-riscv@nongnu.org>; Mon, 26 Sep 2022 16:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=HHqOYlJRTUhJos2Phrlf8XYG4/p/XEFwVZV00V30rkg=;
 b=Fi9mbF39Ua23J+xg2gVGTCMp/VBlTgt74o0Kohc3XfSoi5/Dpfg0a0aPoXF9irsSDb
 k0p3Iq1V/UFVMbbvS9HrxBaTw8+EpBgHWgmF7MbMLjw/F0f2psB1LSK4vISSM19+Dnfr
 wwZLGxx+cUiWd/ZlLAlFOH/IkYUqW9ZPYN4aWl3ys3ybVwBg/7/knWE4Mtq79iaRDOFz
 0wsAQFBo5hezf0NcE7EA6qfAWMql9DPpxZOqyToMuef0K4qgJYhPpFpIn6qKkA9SISPO
 ME6ElL3/srotWQHnmQBRc4ruIB8uJouoy2TmBM1QgE03U0WHvYj3dbHtGiJYdwgKV42h
 hqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=HHqOYlJRTUhJos2Phrlf8XYG4/p/XEFwVZV00V30rkg=;
 b=0RwGkVsqmql6hWyPrzQfhXEy+uRAblQiV1DdNQM3Y2ds25lBysF/cJ8fNf6zArIAes
 t2Uyikhq3hbfQl63XLxDaHCyWo2TXm1wKE3nanOuh1H6i7h1n7H6JGBMfel5Z7NQv6gQ
 BO3EOjdg+cgjEfAO4rQCnJvjcBx8bkxAgLr/pkeuAXpUb09WuZLZJ/F2iEYe9wB3a59U
 Jp7mZRK1vpEVviBIab3AESdxEMEZVOmYUe720d6rPqf2nWTatjax2ocFqGnaxvgQfrdH
 cKUwddBUMTOENee12PfOhqqi+uGo3iqEmgA6fucn8+SQfoiqsrYmmCRGAdNr0KsuDV6v
 BbhA==
X-Gm-Message-State: ACrzQf0XXwlshNXLvQrsbYtxdI3Yx/1R27YwHsqhDRhb4ZccuA3iR3i6
 EB/+5FclgawCAq+mF3g0pBseMK83hE77QWSC5LiCOA==
X-Google-Smtp-Source: AMsMyM4I/eGOL4c0n1O25GlZBtQ/fIEvhrJnz2ND1fg3IQ6zRdSCJ94TTvUKQgGmowN9ndt0CYktdS5E0N83ngqWfmU=
X-Received: by 2002:a63:a505:0:b0:438:675d:caee with SMTP id
 n5-20020a63a505000000b00438675dcaeemr22613798pgf.576.1664233442712; Mon, 26
 Sep 2022 16:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAB88-qOh7dBoFP4SWcM4G5EVp6cumVnZ5j4tNRqSvMT08=dAcA@mail.gmail.com>
 <55a69b23-3bea-0676-478a-d257fc4febf5@redhat.com>
In-Reply-To: <55a69b23-3bea-0676-478a-d257fc4febf5@redhat.com>
From: Tyler Ng <tkng@rivosinc.com>
Date: Mon, 26 Sep 2022 16:03:51 -0700
Message-ID: <CAB88-qO7vw4gC6JNuX=CcnXmYznPdwdhv_nJNrejVzFXSoLQnQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/watchdog: wdt_ibex_aon.c: Implement the
 watchdog for the OpenTitan
To: Thomas Huth <thuth@redhat.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002d3e3c05e99c8b36"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=tkng@rivosinc.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 26 Sep 2022 23:04:07 -0000

--0000000000002d3e3c05e99c8b36
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Thu, Sep 22, 2022 at 9:17 AM Thomas Huth <thuth@redhat.com> wrote:

> On 22/09/2022 17.58, Tyler Ng wrote:
> > This commit adds most of an implementation of the OpenTitan Always-On
> > Timer. The documentation for this timer is found here:
> >
> > https://docs.opentitan.org/hw/ip/aon_timer/doc/
> >
> > Using commit 217a0168ba118503c166a9587819e3811eeb0c0c
> >
> > The implementation includes most of the watchdog features; it does not
> > implement the wakeup timer.
> >
> > An important note: the OpenTitan board uses the sifive_plic. The plic
> > will not be able to claim the bark interrupt (159) because the sifive
> > plic sets priority[159], but checks priority[158] for the priority, so
> > it thinks that the interrupt's priority is 0 (effectively disabled).
> ...
> > diff --git a/tests/qtest/ibex-aon-timer-test.c
> > b/tests/qtest/ibex-aon-timer-test.c
> > new file mode 100644
> > index 0000000000..af33feac39
> > --- /dev/null
> > +++ b/tests/qtest/ibex-aon-timer-test.c
> > @@ -0,0 +1,189 @@
> > +/*
> > + * Testing the OpenTitan AON Timer
> > + *
> > + * Copyright (c) 2022 Rivos Inc.
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> obtaining a copy
> > + * of this software and associated documentation files (the
> > "Software"), to deal
> > + * in the Software without restriction, including without limitation
> the rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> > + * copies of the Software, and to permit persons to whom the Software is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > ARISING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS IN
> > + * THE SOFTWARE.
>
> Could you maybe add a SPDX license identifier at the beginning of the
> comment, so that it's easier to identify the license at a first glance?
> (also in the other new files)
>
> Will do, was actually thinking of switching over to GPL-2.0-or-later as
opposed to MIT.


> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "libqtest.h"
> > +#include "qapi/qmp/qdict.h"
> > +
> > +#define AON_BASE_ADDR (0x40470000ul)
> > +#define AON_ADDR(addr) (AON_BASE_ADDR + addr)
> > +#define AON_WKUP_IRQ 158
> > +#define AON_BARK_IRQ 159
> > +#define AON_FREQ 200000 /* 200 KHz */
> > +#define AON_PERIOD_NS 5000
> > +#define NANOS_PER_SECOND 1000000000LL
> > +/* Test that reads work, and that the regs get reset to the correct
> value */
> > +static void test_reads(void)
> > +{
> > +    QTestState *test = qtest_init("-M opentitan");
> > +    g_assert(qtest_readl(test, AON_ADDR(0x00)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x04)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x08)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x0c)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x10)) == 1); > +
> g_assert(qtest_readl(test, AON_ADDR(0x14)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x18)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x1c)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x20)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x24)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x28)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x2c)) == 0);
>
> The read tests that check for 0 could maybe be simplified with a for-loop
> (or two).
>
I'm not entirely sure about what benefit this would bring after writing it
out.

>
> > +    qtest_quit(test);
> > +}
> > +
> > +static void test_writes(void)
> > +{
> > +    /* Test that writes worked, while the config is unlocked */
> > +    QTestState *test = qtest_init("-M opentitan");
> > +
> > +
> > +    qtest_writel(test, AON_ADDR(0x18), (1 << 19)); /* WDOG_BARK_THOLD */
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x18)),
> > +                     ==, (1 << 19));
> > +
> > +    qtest_writel(test, AON_ADDR(0x1c), (1 << 20)); /* WDOG_BITE_THOLD */
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x1c)),
> > +                     ==, (1 << 20));
> > +
> > +    qtest_writel(test, AON_ADDR(0x14), 0x1); /* WDOG_CTRL enable */
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x14)),
> > +                     ==, 0x1);
> > +
> > +    qtest_writel(test, AON_ADDR(0x10), 0x0); /* WDOG_REGWEN enable */
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x10)), ==, 0x0);
>
> I think the above code would be better readable if you'd provide a helper
> function like this:
>
> static void writel_and_assert(QTestState qts, int addr, int val)
> {
>      qtest_writel(qts, AON_ADDR(addr), val);
>      g_assert_cmpuint(qtest_readl(qts, AON_ADDR(addr)), val);
> }
>
> Thanks for the suggestion. I decided to go with a macro instead though,
because it makes it easier to distinguish where an assertion failed without
a debugger.


> > +    /*
> > +     * Test configuration lock
> > +     * These should not successfully write.
> > +     */
> > +    qtest_writel(test, AON_ADDR(0x14), 0);
> > +    qtest_writel(test, AON_ADDR(0x18), 0);
> > +    qtest_writel(test, AON_ADDR(0x1c), 0);
> > +
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x14)),
> > +                     ==, 0x1);
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x18)),
> > +                     ==, (1 << 19));
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x1c)),
> > +                     ==, (1 << 20));
> > +
> > +    /* This should not work, as it's a rw0c reg. */
> > +    qtest_writel(test, AON_ADDR(0x10), 1);
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x10)),
> > +                     ==, 0x0);
> > +
> > +    qtest_quit(test);
> > +}
> > +
> > +
> > +/* Test whether the watchdog timer works during normal operation */
> > +static void test_operation(void)
> > +{
> > +    QTestState *test = qtest_init("-M opentitan");
> > +
> > +    /* Set up interrupts */
> > +    qtest_irq_intercept_in(test, "/machine/soc/plic");
> > +
> > +    /* Setup timer */
> > +    qtest_writel(test, AON_ADDR(0x18), (1 << 19)); /* WDOG_BARK_THOLD */
> > +    qtest_writel(test, AON_ADDR(0x1c), (1 << 20)); /* WDOG_BITE_THOLD */
> > +
> > +    /* Run simulation, without enabling timer: */
> > +    qtest_clock_step(test, NANOS_PER_SECOND * 30);
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> > +                     ==, 0); /* checks if WDOG_COUNT gets updated */
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> > +                     ==, 0); /* checks if INTR_STATE is clear */
> > +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> > +
> > +    /* Enable the timer, and test if the count is updated correctly */
> > +    qtest_writel(test, AON_ADDR(0x14), 0x1); /* set WDOG_CTRL = 1 */
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> > +                     ==, 0);
> > +    qtest_clock_step(test, NANOS_PER_SECOND);
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> > +                     ==, AON_FREQ);
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> > +                     ==, 0);
> > +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> > +
> > +    /* Disable the timer, and test if the count freezes */
> > +    qtest_writel(test, AON_ADDR(0x14), 0x0); /* set WDOG_CTRL = 0 */
> > +    qtest_clock_step(test, NANOS_PER_SECOND);
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> > +                     ==, AON_FREQ);
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> > +                     ==, 0);
> > +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> > +
> > +    /* Enable the timer, and run to bark */
> > +    qtest_writel(test, AON_ADDR(0x14), 0x1); /* set WDOG_CTRL = 1 */
> > +    qtest_clock_step(test, NANOS_PER_SECOND * 1.62145);
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> > +                     >=, (1 << 19));
> > +    g_assert(qtest_get_irq(test, AON_BARK_IRQ));
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> > +                     ==, (1 << 1));
> > +
> > +    /* Disable IRQ by writing to INTR_STATE. Should bark next cycle */
> > +    qtest_writel(test, AON_ADDR(0x24), (1 << 1));
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> > +                     ==, (1 << 1));
> > +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> > +    qtest_clock_step(test, AON_PERIOD_NS);
> > +    g_assert(qtest_get_irq(test, AON_BARK_IRQ));
> > +    /*
> > +     * Disable IRQ again, this time by setting WDOG_COUNT = 0 (pet) and
> > +     * writing to INTR_STATE.
> > +     */
> > +    qtest_writel(test, AON_ADDR(0x20), 0);
> > +    qtest_writel(test, AON_ADDR(0x24), (1 << 1));
> > +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> > +
> > +    /* Ensure no bite occurs, after resetting the timer. */
> > +    qtest_clock_step(test, NANOS_PER_SECOND * 2.621436);
> > +    QDict *resp = qtest_qmp(test, "{'execute':'query-status'}");
> > +    g_assert(qdict_haskey(resp, "return"));
> > +    qobject_unref(resp);
> > +
> > +    /* Allow test to run to bite. */
> > +    qtest_clock_step(test, NANOS_PER_SECOND * 5.24289);
> > +    QDict *data = qdict_get_qdict(qtest_qmp_eventwait_ref(test,
> "WATCHDOG"),
> > +                                  "data");
> > +    g_assert_cmpstr(qdict_get_str(data, "action"), ==, "reset");
> > +    qobject_unref(data);
> > +    qtest_quit(test);
> > +}
> > +
> > +
> > +
>
> Please avoid multiple blank lines (it's not very common in QEMU, I think).
>
I always miss a few strays here and there. Thanks.

> +int main(int argc, char **argv)
> > +{
> > +    g_test_init(&argc, &argv, NULL);
> > +    qtest_add_func("/ibex-aon-timer/reads", test_reads);
> > +    qtest_add_func("/ibex-aon-timer/writes", test_writes);
> > +    qtest_add_func("/ibex-aon-timer/op", test_operation);
> > +    return g_test_run();
> > +}
>
>   Thomas
>
> -Tyler

--0000000000002d3e3c05e99c8b36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Thomas,<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 22, =
2022 at 9:17 AM Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On 22/09/2022 17.58, Tyler Ng wrote:<br>
&gt; This commit adds most of an implementation of the OpenTitan Always-On<=
br>
&gt; Timer. The documentation for this timer is found here:<br>
&gt; <br>
&gt; <a href=3D"https://docs.opentitan.org/hw/ip/aon_timer/doc/" rel=3D"nor=
eferrer" target=3D"_blank">https://docs.opentitan.org/hw/ip/aon_timer/doc/<=
/a><br>
&gt; <br>
&gt; Using commit 217a0168ba118503c166a9587819e3811eeb0c0c<br>
&gt; <br>
&gt; The implementation includes most of the watchdog features; it does not=
<br>
&gt; implement the wakeup timer.<br>
&gt; <br>
&gt; An important note: the OpenTitan board uses the sifive_plic. The plic<=
br>
&gt; will not be able to claim the bark interrupt (159) because the sifive<=
br>
&gt; plic sets priority[159], but checks priority[158] for the priority, so=
<br>
&gt; it thinks that the interrupt&#39;s priority is 0 (effectively disabled=
).<br>
...<br>
&gt; diff --git a/tests/qtest/ibex-aon-timer-test.c<br>
&gt; b/tests/qtest/ibex-aon-timer-test.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..af33feac39<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/qtest/ibex-aon-timer-test.c<br>
&gt; @@ -0,0 +1,189 @@<br>
&gt; +/*<br>
&gt; + * Testing the OpenTitan AON Timer<br>
&gt; + *<br>
&gt; + * Copyright (c) 2022 Rivos Inc.<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a copy<br>
&gt; + * of this software and associated documentation files (the<br>
&gt; &quot;Software&quot;), to deal<br>
&gt; + * in the Software without restriction, including without limitation =
the rights<br>
&gt; + * to use, copy, modify, merge, publish, distribute, sublicense, and/=
or sell<br>
&gt; + * copies of the Software, and to permit persons to whom the Software=
 is<br>
&gt; + * furnished to do so, subject to the following conditions:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice shall be inc=
luded in<br>
&gt; + * all copies or substantial portions of the Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,<br=
>
&gt; ARISING FROM,<br>
&gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEAL=
INGS IN<br>
&gt; + * THE SOFTWARE.<br>
<br>
Could you maybe add a SPDX license identifier at the beginning of the <br>
comment, so that it&#39;s easier to identify the license at a first glance?=
 <br>
(also in the other new files)<br>
<br></blockquote><div>Will do, was actually thinking of switching over to G=
PL-2.0-or-later as opposed to MIT.<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;libqtest.h&quot;<br>
&gt; +#include &quot;qapi/qmp/qdict.h&quot;<br>
&gt; +<br>
&gt; +#define AON_BASE_ADDR (0x40470000ul)<br>
&gt; +#define AON_ADDR(addr) (AON_BASE_ADDR + addr)<br>
&gt; +#define AON_WKUP_IRQ 158<br>
&gt; +#define AON_BARK_IRQ 159<br>
&gt; +#define AON_FREQ 200000 /* 200 KHz */<br>
&gt; +#define AON_PERIOD_NS 5000<br>
&gt; +#define NANOS_PER_SECOND 1000000000LL<br>
&gt; +/* Test that reads work, and that the regs get reset to the correct v=
alue */<br>
&gt; +static void test_reads(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 QTestState *test =3D qtest_init(&quot;-M opentitan&quot=
;);<br>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x00)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x04)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x08)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x0c)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x10)) =3D=3D 1); &=
gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x14)) =3D=3D 0);<br=
>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x18)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x1c)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x20)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x24)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x28)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x2c)) =3D=3D 0);<b=
r>
<br>
The read tests that check for 0 could maybe be simplified with a for-loop <=
br>
(or two).<br></blockquote><div>I&#39;m not entirely sure about what benefit=
 this would bring after writing it out. <br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 qtest_quit(test);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void test_writes(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 /* Test that writes worked, while the config is unlocke=
d */<br>
&gt; +=C2=A0 =C2=A0 QTestState *test =3D qtest_init(&quot;-M opentitan&quot=
;);<br>
&gt; +<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x18), (1 &lt;&lt; 19)); /*=
 WDOG_BARK_THOLD */<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x18)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, (1 &lt;&lt; 19));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x1c), (1 &lt;&lt; 20)); /*=
 WDOG_BITE_THOLD */<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x1c)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, (1 &lt;&lt; 20));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x14), 0x1); /* WDOG_CTRL e=
nable */<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x14)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, 0x1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x10), 0x0); /* WDOG_REGWEN=
 enable */<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x10)), =3D=
=3D, 0x0);<br>
<br>
I think the above code would be better readable if you&#39;d provide a help=
er <br>
function like this:<br>
<br>
static void writel_and_assert(QTestState qts, int addr, int val)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0qtest_writel(qts, AON_ADDR(addr), val);<br>
=C2=A0 =C2=A0 =C2=A0g_assert_cmpuint(qtest_readl(qts, AON_ADDR(addr)), val)=
;<br>
}<br>
<br></blockquote><div>Thanks for the suggestion. I decided to go with a mac=
ro instead though, because it makes it easier to distinguish where an asser=
tion failed without a debugger. </div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Test configuration lock<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* These should not successfully write.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x14), 0);<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x18), 0);<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x1c), 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x14)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, 0x1);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x18)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, (1 &lt;&lt; 19));<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x1c)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, (1 &lt;&lt; 20));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* This should not work, as it&#39;s a rw0c reg. */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x10), 1);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x10)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, 0x0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qtest_quit(test);<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +/* Test whether the watchdog timer works during normal operation */<b=
r>
&gt; +static void test_operation(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 QTestState *test =3D qtest_init(&quot;-M opentitan&quot=
;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Set up interrupts */<br>
&gt; +=C2=A0 =C2=A0 qtest_irq_intercept_in(test, &quot;/machine/soc/plic&qu=
ot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Setup timer */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x18), (1 &lt;&lt; 19)); /*=
 WDOG_BARK_THOLD */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x1c), (1 &lt;&lt; 20)); /*=
 WDOG_BITE_THOLD */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Run simulation, without enabling timer: */<br>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, NANOS_PER_SECOND * 30);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, 0); /* checks if WDOG_COUNT gets updated */<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, 0); /* checks if INTR_STATE is clear */<br>
&gt; +=C2=A0 =C2=A0 g_assert(!qtest_get_irq(test, AON_BARK_IRQ));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Enable the timer, and test if the count is updated c=
orrectly */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x14), 0x1); /* set WDOG_CT=
RL =3D 1 */<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, 0);<br>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, NANOS_PER_SECOND);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, AON_FREQ);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, 0);<br>
&gt; +=C2=A0 =C2=A0 g_assert(!qtest_get_irq(test, AON_BARK_IRQ));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Disable the timer, and test if the count freezes */<=
br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x14), 0x0); /* set WDOG_CT=
RL =3D 0 */<br>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, NANOS_PER_SECOND);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, AON_FREQ);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, 0);<br>
&gt; +=C2=A0 =C2=A0 g_assert(!qtest_get_irq(test, AON_BARK_IRQ));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Enable the timer, and run to bark */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x14), 0x1); /* set WDOG_CT=
RL =3D 1 */<br>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, NANOS_PER_SECOND * 1.62145);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&gt;=3D, (1 &lt;&lt; 19));<br>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_get_irq(test, AON_BARK_IRQ));<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, (1 &lt;&lt; 1));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Disable IRQ by writing to INTR_STATE. Should bark ne=
xt cycle */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x24), (1 &lt;&lt; 1));<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, (1 &lt;&lt; 1));<br>
&gt; +=C2=A0 =C2=A0 g_assert(!qtest_get_irq(test, AON_BARK_IRQ));<br>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, AON_PERIOD_NS);<br>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_get_irq(test, AON_BARK_IRQ));<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Disable IRQ again, this time by setting WDOG_CO=
UNT =3D 0 (pet) and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* writing to INTR_STATE.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x20), 0);<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x24), (1 &lt;&lt; 1));<br>
&gt; +=C2=A0 =C2=A0 g_assert(!qtest_get_irq(test, AON_BARK_IRQ));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Ensure no bite occurs, after resetting the timer. */=
<br>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, NANOS_PER_SECOND * 2.621436);<br=
>
&gt; +=C2=A0 =C2=A0 QDict *resp =3D qtest_qmp(test, &quot;{&#39;execute&#39=
;:&#39;query-status&#39;}&quot;);<br>
&gt; +=C2=A0 =C2=A0 g_assert(qdict_haskey(resp, &quot;return&quot;));<br>
&gt; +=C2=A0 =C2=A0 qobject_unref(resp);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Allow test to run to bite. */<br>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, NANOS_PER_SECOND * 5.24289);<br>
&gt; +=C2=A0 =C2=A0 QDict *data =3D qdict_get_qdict(qtest_qmp_eventwait_ref=
(test, &quot;WATCHDOG&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;data&quot;);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpstr(qdict_get_str(data, &quot;action&quot;)=
, =3D=3D, &quot;reset&quot;);<br>
&gt; +=C2=A0 =C2=A0 qobject_unref(data);<br>
&gt; +=C2=A0 =C2=A0 qtest_quit(test);<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +<br>
<br>
Please avoid multiple blank lines (it&#39;s not very common in QEMU, I thin=
k).<br></blockquote><div>I always miss a few strays here and there. Thanks.=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +int main(int argc, char **argv)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 g_test_init(&amp;argc, &amp;argv, NULL);<br>
&gt; +=C2=A0 =C2=A0 qtest_add_func(&quot;/ibex-aon-timer/reads&quot;, test_=
reads);<br>
&gt; +=C2=A0 =C2=A0 qtest_add_func(&quot;/ibex-aon-timer/writes&quot;, test=
_writes);<br>
&gt; +=C2=A0 =C2=A0 qtest_add_func(&quot;/ibex-aon-timer/op&quot;, test_ope=
ration);<br>
&gt; +=C2=A0 =C2=A0 return g_test_run();<br>
&gt; +}<br>
<br>
=C2=A0 Thomas<br>
<br></blockquote><div>-Tyler <br></div></div></div>

--0000000000002d3e3c05e99c8b36--

